<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Page;
use App\Models\User;
use App\Models\Frontend;
use App\Models\Language;
use App\Models\Location;
use App\Models\Property;
use App\Constants\Status;
use App\Models\Subscriber;
use App\Models\TimeSetting;
use Illuminate\Http\Request;
use App\Models\SupportTicket;
use App\Models\SupportMessage;
use App\Models\AdminNotification;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Validator;

class SiteController extends Controller
{
    public function index()
    {
        $reference = @$_GET['reference'];
        if ($reference) {
            session()->put('reference', $reference);
        }

        $pageTitle = 'Home';
        $sections = Page::where('tempname', activeTemplate())->where('slug', '/')->first();
        $seoContents = $sections->seo_content;
        $seoImage = @$seoContents->image ? getImage(getFilePath('seo') . '/' . @$seoContents->image, getFileSize('seo')) : null;
        return view('Template::home', compact('pageTitle', 'sections', 'seoContents', 'seoImage'));
    }

    public function pages($slug)
    {
        $page = Page::where('tempname', activeTemplate())->where('slug', $slug)->firstOrFail();
        $pageTitle = $page->name;
        $sections = $page->secs;
        $seoContents = $page->seo_content;
        $seoImage = @$seoContents->image ? getImage(getFilePath('seo') . '/' . @$seoContents->image, getFileSize('seo')) : null;
        return view('Template::pages', compact('pageTitle', 'sections', 'seoContents', 'seoImage'));
    }

    public function contact()
    {
        $pageTitle = "Contact Us";
        $user = auth()->user();
        $sections = Page::where('tempname', activeTemplate())->where('slug', 'contact')->first();
        $contactContent = Frontend::where('data_keys', 'contact_us.content')->firstOrFail();
        $seoContents = $sections->seo_content;
        $seoImage = @$seoContents->image ? getImage(getFilePath('seo') . '/' . @$seoContents->image, getFileSize('seo')) : null;
        return view('Template::contact', compact('pageTitle', 'user', 'sections', 'seoContents', 'seoImage', 'contactContent'));
    }

    public function contactSubmit(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required',
            'subject' => 'required|string|max:255',
            'message' => 'required',
        ]);

        if (!verifyCaptcha()) {
            $notify[] = ['error', 'Invalid captcha provided'];
            return back()->withNotify($notify);
        }

        $request->session()->regenerateToken();

        $random = getNumber();

        $ticket = new SupportTicket();
        $ticket->user_id = auth()->id() ?? 0;
        $ticket->name = $request->name;
        $ticket->email = $request->email;
        $ticket->priority = Status::PRIORITY_MEDIUM;


        $ticket->ticket = $random;
        $ticket->subject = $request->subject;
        $ticket->last_reply = Carbon::now();
        $ticket->status = Status::TICKET_OPEN;
        $ticket->save();

        $adminNotification = new AdminNotification();
        $adminNotification->user_id = auth()->user() ? auth()->user()->id : 0;
        $adminNotification->title = 'A new contact message has been submitted';
        $adminNotification->click_url = urlPath('admin.ticket.view', $ticket->id);
        $adminNotification->save();

        $message = new SupportMessage();
        $message->support_ticket_id = $ticket->id;
        $message->message = $request->message;
        $message->save();

        $notify[] = ['success', 'Ticket created successfully!'];
        return to_route('ticket.view', [$ticket->ticket])->withNotify($notify);
    }

    public function policyPages($slug)
    {
        $policy = Frontend::where('slug', $slug)->where('data_keys', 'policy_pages.element')->firstOrFail();
        $pageTitle = $policy->data_values->title;
        $seoContents = $policy->seo_content;
        $seoImage = @$seoContents->image ? frontendImage('policy_pages', $seoContents->image, getFileSize('seo'), true) : null;
        return view('Template::policy', compact('policy', 'pageTitle', 'seoContents', 'seoImage'));
    }

    public function changeLanguage($lang = null)
    {
        $language = Language::where('code', $lang)->first();
        if (!$language) $lang = 'en';
        session()->put('lang', $lang);
        return back();
    }

    public function blogs()
    {
        $pageTitle = 'Blogs';
        $blogs = Frontend::where('data_keys', 'blog.element')->orderByDesc('id')->paginate(getPaginate());
        $sections = Page::where('tempname', activeTemplate())->where('slug', 'blog')->first();
        $seoContents = $sections->seo_content;
        $seoImage = @$seoContents->image ? getImage(getFilePath('seo') . '/' . @$seoContents->image, getFileSize('seo')) : null;
        return view('Template::blogs', compact('pageTitle', 'blogs', 'sections', 'seoContents', 'seoImage'));
    }

    public function blogDetails($slug)
    {
        $blog = Frontend::where('slug', $slug)->where('data_keys', 'blog.element')->firstOrFail();
        $latestBlogs = Frontend::where('data_keys', 'blog.element')->where('id', '<>', $blog->id)->orderByDesc('id')->take(5)->get();
        $pageTitle = $blog->data_values->title;
        $seoContents = $blog->seo_content;
        $seoImage = @$seoContents->image ? frontendImage('blog', $seoContents->image, getFileSize('seo'), true) : null;
        return view('Template::blog_details', compact('blog', 'pageTitle', 'seoContents', 'seoImage', 'latestBlogs'));
    }

    public function property(Request $request)
    {
        $pageTitle  = 'Properties';

        $properties = Property::active()
            ->searchable(['title'])
            ->filter(['location_id', 'is_capital_back'])
            ->withSum('invests', 'total_invest_amount')
            ->withCount('invests')
            ->with(['location', 'profitScheduleTime', 'installmentDuration', 'invests'])
            ->orderByDesc('id');

        if ($request->invest_type) {
            $properties->where('invest_type', $request->invest_type);
        }

        if ($request->profit_schedule) {
            $properties->where('profit_schedule', $request->profit_schedule);
        }

        if ($request->minimum_invest) {
            $properties->where('per_share_amount', '>=', $request->minimum_invest);
        }

        if ($request->maximum_invest) {
            $properties->where('per_share_amount', '<=', $request->maximum_invest);
        }

        $properties       = $properties->paginate(getPaginate());
        $user             = auth()->user();
        $localities       = Location::active()->get();
        $activeProperties = Property::active()->get();
        $sections         = Page::where('tempname', activeTemplate())->where('slug', 'property')->first();
        $seoContents      = $sections->seo_content;
        $seoImage         = @$seoContents->image ? getImage(getFilePath('seo') . '/' . @$seoContents->image, getFileSize('seo')) : null;
        $times            = TimeSetting::orderBy('time')->active()->get();

        return view('Template::property', compact('pageTitle', 'properties', 'user', 'localities', 'sections', 'times','seoContents','seoImage','times'));
    }

    public function propertyDetails($slug, $id)
    {
        $property = Property::active()
            ->with(['location', 'profitScheduleTime', 'invests' => function ($invests) {
                $invests->where('user_id', auth()->id());
            }, 'propertyGallery'])
            ->withSum('invests', 'total_invest_amount')
            ->withCount('invests')
            ->findOrFail($id);

        $pageTitle = 'Property Details';
        $user      = auth()->user();
        $investors = User::active()
            ->whereHas('invests', function ($invests) use ($property) {
                $invests->where('property_id', $property->id);
            })
            ->withCount('invests')
            ->take(5)->get();

        $latestProperties = Property::active()
            ->where('id', '<>', $property->id)
            ->with(['location'])
            ->orderByDesc('id')
            ->take(6)->get();

        $seoContents['keywords']           = $property->keywords ?? Frontend::where('data_keys', 'seo.data')->first('data_values')?->data_values->keywords;
        $seoContents['social_title']       = $property->title;
        $seoContents['description']        = strLimit(strip_tags($property->details), 150);
        $seoContents['social_description'] = strLimit(strip_tags($property->details), 150);
        $seoContents['image']              = getImage(getFilePath('propertyThumb') . '/' . @$property->thumb_image, getFileSize('propertyThumb'));
        $seoContents['image_size']         = getFileSize('propertyThumb');

        return view('Template::property_details', compact('pageTitle', 'property', 'user', 'investors', 'latestProperties', 'seoContents'));
    }

    public function cookieAccept()
    {
        Cookie::queue('gdpr_cookie', gs('site_name'), 43200);
    }

    public function cookiePolicy()
    {
        $cookieContent = Frontend::where('data_keys', 'cookie.data')->first();
        abort_if($cookieContent->data_values->status != Status::ENABLE, 404);
        $pageTitle = 'Cookie Policy';
        $cookie = Frontend::where('data_keys', 'cookie.data')->first();
        return view('Template::cookie', compact('pageTitle', 'cookie'));
    }

    public function placeholderImage($size = null)
    {
        $imgWidth = explode('x', $size)[0];
        $imgHeight = explode('x', $size)[1];
        $text = $imgWidth . '×' . $imgHeight;
        $fontFile = realpath('assets/font/solaimanLipi_bold.ttf');
        $fontSize = round(($imgWidth - 50) / 8);
        if ($fontSize <= 9) {
            $fontSize = 9;
        }
        if ($imgHeight < 100 && $fontSize > 30) {
            $fontSize = 30;
        }

        $image     = imagecreatetruecolor($imgWidth, $imgHeight);
        $colorFill = imagecolorallocate($image, 100, 100, 100);
        $bgFill    = imagecolorallocate($image, 255, 255, 255);
        imagefill($image, 0, 0, $bgFill);
        $textBox = imagettfbbox($fontSize, 0, $fontFile, $text);
        $textWidth  = abs($textBox[4] - $textBox[0]);
        $textHeight = abs($textBox[5] - $textBox[1]);
        $textX      = ($imgWidth - $textWidth) / 2;
        $textY      = ($imgHeight + $textHeight) / 2;
        header('Content-Type: image/jpeg');
        imagettftext($image, $fontSize, 0, $textX, $textY, $colorFill, $fontFile, $text);
        imagejpeg($image);
        imagedestroy($image);
    }

    public function maintenance()
    {
        $pageTitle = 'Maintenance Mode';
        if (gs('maintenance_mode') == Status::DISABLE) {
            return to_route('home');
        }
        $maintenance = Frontend::where('data_keys', 'maintenance.data')->first();
        return view('Template::maintenance', compact('pageTitle', 'maintenance'));
    }

    public function addSubscriber(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email|max:255|unique:subscribers,email',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()->all()]);
        }
        $subscriber        = new Subscriber();
        $subscriber->email = $request->email;
        $subscriber->save();

        return response()->json(['success' => true, 'message' => 'Subscribed successfully']);
    }
}

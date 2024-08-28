@extends($activeTemplate . 'layouts.frontend')
@section('content')
    <section class="account">
        <div class="account-inner py-120 bg-pattern3">
            <div class="container ">
                <div class="d-flex justify-content-center">
                    <div class="verification-code-wrapper">
                        <div class="verification-area">
                            <form action="{{ route('user.verify.mobile') }}" method="POST" class="submit-form">
                                @csrf
                                <p class="verification-text mb-3">@lang('A 6 digit verification code sent to your mobile number') :
                                    +{{ showMobileNumber($user->mobile) }}</p>
                                @include($activeTemplate . 'partials.verification_code')
                                <div class="mb-3">
                                    <button type="submit" class="btn btn--base w-100">@lang('Submit')</button>
                                </div>
                                <div class="">
                                    <p>
                                        @lang('If you don\'t get any code'), <span class="countdown-wrapper">@lang('try again after') <span
                                                id="countdown" class="fw-bold">--</span> @lang('seconds')</span> <a
                                            href="{{ route('user.send.verify.code', 'sms') }}"
                                            class="try-again-link d-none"> @lang('Try again')</a>
                                    </p>
                                    @if ($errors->has('resend'))
                                        <br />
                                        <small class="text-danger">{{ $errors->first('resend') }}</small>
                                    @endif
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@push('script')
    <script>
        var timeZone = '{{ now()->timezoneName }}';
        var countDownDate = new Date("{{ showDateTime($user->ver_code_send_at->addMinutes(2), 'M d, Y H:i:s') }}");
        countDownDate = countDownDate.getTime();
        var x = setInterval(function() {
            var now = new Date();
            now = new Date(now.toLocaleString('en-US', {
                timeZone: timeZone
            }));
            var distance = countDownDate - now;
            var seconds = Math.floor(distance / 1000);
            document.getElementById("countdown").innerHTML = seconds;
            if (distance < 0) {
                clearInterval(x);
                document.querySelector('.countdown-wrapper').classList.add('d-none');
                document.querySelector('.try-again-link').classList.remove('d-none');
            }
        }, 1000);
    </script>
@endpush

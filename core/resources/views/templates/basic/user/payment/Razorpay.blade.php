@extends($activeTemplate . 'layouts.master')
@section('content')
    @php
        $pageTitle = $pageTitle . ': Razorpay';
    @endphp
        <div class="row dashboard-widget-wrapper justify-content-center">
            <div class="col-md-12">
                <ul class="list-group text-center list-group-flush">
                    <li class="list-group-item d-flex justify-content-between">
                        @lang('You have to pay '):
                        <strong>{{ showAmount($deposit->final_amount,currencyFormat:false) }} {{ __($deposit->method_currency) }}</strong>
                    </li>
                    <li class="list-group-item d-flex justify-content-between">
                        @lang('You will get '):
                        <strong>{{ showAmount($deposit->amount) }}</strong>
                    </li>
                </ul>
                <form action="{{ $data->url }}" method="{{ $data->method }}">
                    <input type="hidden" custom="{{ $data->custom }}" name="hidden">
                    <script src="{{ $data->checkout_js }}"
                        @foreach ($data->val as $key => $value)
                        data-{{ $key }}="{{ $value }}" @endforeach>
                    </script>
                </form>
            </div>
        </div>
@endsection

@push('script')
    <script>
        (function($) {
            "use strict";
            $('input[type="submit"]').addClass("mt-4 btn btn--base w-100");
        })(jQuery);
    </script>
@endpush

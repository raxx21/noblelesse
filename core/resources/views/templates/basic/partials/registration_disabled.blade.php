@php
    $registrationDisabled = getContent('register_disable.content', true);
@endphp

<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="register-disable-image d-flex justify-content-center mb-3">
                <img class="fit-image"
                    src="{{ frontendImage('register_disable', @$registrationDisabled->data_values->image, '280x280') }}"
                    alt="">
            </div>
            <h5 class="register-disable-title text-center ">{{ __(@$registrationDisabled->data_values->heading) }}</h5>
            <p class="register-disable-desc text-center">
                {{ __(@$registrationDisabled->data_values->subheading) }}
            </p>
            <div class="text-center mt-5">
                <a href="{{ @$registrationDisabled->data_values->button_url }}"
                    class="btn btn--base btn--sm">{{ __(@$registrationDisabled->data_values->button_name) }}</a>
            </div>
        </div>
    </div>
</div>

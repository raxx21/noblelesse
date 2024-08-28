<div class="sidebar-menu">
    <div class="sidebar-menu__inner">
        <div class="cross-sidebar"><i class="fas fa-times"></i></div>
        <ul class="sidebar-menu-list">
            <li class="sidebar-menu-list__item">
                <a href="{{ route('user.home') }}" class="sidebar-menu-list__link {{ menuActive('user.home') }}">
                    <span class="icon"><i class="fas fa-th-large"></i></span>
                    <span class="text">@lang('Dashboard')</span>
                </a>
            </li>
            <li class="sidebar-menu-list__item">
                <a href="{{ route('user.invest.history') }}" class="sidebar-menu-list__link {{ menuActive('user.invest*') }}">
                    <span class="icon"><i class="fas fa-dolly-flatbed"></i></span>
                    <span class="text">@lang('My Investments')</span>
                </a>
            </li>
            <li class="sidebar-menu-list__item">
                <a href="{{ route('user.profit.history') }}" class="sidebar-menu-list__link {{ menuActive('user.profit.history') }}">
                    <span class="icon"><i class="fas fa-coins"></i></span>
                    <span class="text">@lang('Profit History')</span>
                </a>
            </li>
            <li class="sidebar-menu-list__item has-dropdown">
                <a href="javascript:void(0)" class="sidebar-menu-list__link {{ menuActive('user.deposit*', 3) }}">
                    <span class="icon"><i class="fas fa-wallet"></i></span>
                    <span class="text">@lang('Deposit')</span>
                </a>
                <div class="sidebar-submenu {{ menuActive('user.deposit*', 2) }}">
                    <ul class="sidebar-submenu-list">
                        <li class="sidebar-submenu-list__item">
                            <a href="{{ route('user.deposit.index') }}"
                                class="sidebar-submenu-list__link {{ menuActive(['user.deposit.index', 'user.deposit.confirm']) }}">
                                <span class="text">@lang('Deposit Money')</span>
                            </a>
                        </li>
                        <li class="sidebar-submenu-list__item">
                            <a href="{{ route('user.deposit.history') }}"
                                class="sidebar-submenu-list__link {{ menuActive('user.deposit.history') }}">
                                <span class="text">@lang('Deposit History')</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </li>
            <li class="sidebar-menu-list__item has-dropdown">
                <a href="javascript:void(0)" class="sidebar-menu-list__link {{ menuActive('user.withdraw*', 3) }}">
                    <span class="icon"><i class="far fa-credit-card"></i></span>
                    <span class="text">@lang('Withdraw')</span>
                </a>
                <div class="sidebar-submenu {{ menuActive('user.withdraw*', 2) }}">
                    <ul class="sidebar-submenu-list">
                        <li class="sidebar-submenu-list__item">
                            <a href="{{ route('user.withdraw') }}"
                                class="sidebar-submenu-list__link {{ menuActive(['user.withdraw', 'user.withdraw.preview']) }}">
                                <span class="text">@lang('Withdraw Money')</span>
                            </a>
                        </li>
                        <li class="sidebar-submenu-list__item">
                            <a href="{{ route('user.withdraw.history') }}"
                                class="sidebar-submenu-list__link {{ menuActive('user.withdraw.history') }}">
                                <span class="text">@lang('Withdraw History')</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </li>
            <li class="sidebar-menu-list__item">
                <a href="{{ route('user.transactions') }}" class="sidebar-menu-list__link {{ menuActive('user.transactions') }}">
                    <span class="icon"><i class="fas fa-exchange-alt"></i></span>
                    <span class="text">@lang('Transactions')</span>
                </a>
            </li>

            <li class="sidebar-menu-list__item">
                <a href="{{ route('user.referrals') }}" class="sidebar-menu-list__link {{ menuActive('user.referrals') }}">
                    <span class="icon"><i class="fas fa-user-friends"></i></span>
                    <span class="text">@lang('Manage Referral')</span>
                </a>
            </li>
            <li class="sidebar-menu-list__item has-dropdown">
                <a href="javascript:void(0)" class="sidebar-menu-list__link {{ menuActive('ticket*', 3) }}">
                    <span class="icon"><i class="fas fa-headset"></i></span>
                    <span class="text">@lang('Support Ticket')</span>
                </a>
                <div class="sidebar-submenu {{ menuActive('ticket*', 2) }}">
                    <ul class="sidebar-submenu-list">
                        <li class="sidebar-submenu-list__item">
                            <a href="{{ route('ticket.index') }}"
                                class="sidebar-submenu-list__link {{ menuActive(['ticket.index', 'ticket.view']) }}">
                                <span class="text">@lang('My Tickets')</span>
                            </a>
                        </li>
                        <li class="sidebar-submenu-list__item">
                            <a href="{{ route('ticket.open') }}" class="sidebar-submenu-list__link {{ menuActive('ticket.open') }}">
                                <span class="text">@lang('Open Ticket')</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </li>
            <li class="sidebar-menu-list__item">
                <a class="sidebar-menu-list__link {{ menuActive('user.profile.setting') }}"
                    href="{{ route('user.profile.setting') }}">
                    <span class="icon"><i class="fas fa-user-circle"></i></span>
                    <span class="text">@lang('Profile Setting')</span>
                </a>
            </li>
            <li class="sidebar-menu-list__item">
                <a class="sidebar-menu-list__link {{ menuActive('user.change.password') }}"
                    href="{{ route('user.change.password') }}">
                    <span class="icon"><i class="fas fa-cog"></i></span>
                    <span class="text">@lang('Change Password')</span>
                </a>
            </li>
            <li class="sidebar-menu-list__item">
                <a class="sidebar-menu-list__link {{ menuActive('user.twofactor') }}"
                    href="{{ route('user.twofactor') }}">
                    <span class="icon"><i class="fas fa-shield-alt"></i></span>
                    <span class="text">@lang('2FA Security')</span>
                </a>
            </li>
            <li class="sidebar-menu-list__item">
                <a class="sidebar-menu-list__link" href="{{ route('user.logout') }}">
                    <span class="icon"><i class="fas fa-sign-out-alt"></i></span>
                    <span class="text">@lang('Logout')</span>
                </a>
            </li>
            
        </ul>
    </div>
</div>

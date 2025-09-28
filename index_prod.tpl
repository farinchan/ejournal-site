<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Rumah Jurnal UIN Sjech M.Djamil Djambek Bukittinggi</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Place favicon.png in the root directory -->
    <link rel="shortcut icon" href="https://rumahjurnal.uinbukittinggi.ac.id/storage/setting/favicon.png"
        type="image/x-icon" />
    <!-- Font Icons css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/farinchan/ejournal-site@main/css/font-icons.css">
    <!-- plugins css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/farinchan/ejournal-site@main/css/plugins.css">
    <!-- Main Stylesheet -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/farinchan/ejournal-site@main/css/style.css">
    <!-- Responsive css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/farinchan/ejournal-site@main/css/responsive.css">
    <!-- Modal Enhancement css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/farinchan/ejournal-site@main/css/modal-enhancement1.css">

    <style>
        /* Enhanced Journal Cards */
        .journal-card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(11, 44, 61, 0.08);
            overflow: hidden;
            transition: all 0.3s ease;
            border: 1px solid rgba(11, 44, 61, 0.1);
            display: flex;
            flex-direction: column;
        }

        .journal-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 40px rgba(11, 44, 61, 0.15);
        }

        .journal-image-container {
            position: relative;
            overflow: hidden;
            flex-shrink: 0;
        }

        .journal-image-wrapper {
            position: relative;
            width: 100%;
            height: 280px;
            overflow: hidden;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
        }

        .journal-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.4s ease;
        }

        .journal-image-link:hover .journal-image {
            transform: scale(1.05);
        }

        .journal-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg, rgba(11, 44, 61, 0.8) 0%, rgba(42, 76, 93, 0.8) 100%);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: opacity 0.3s ease;
            color: white;
        }

        .journal-image-link:hover .journal-overlay {
            opacity: 1;
        }

        .journal-overlay i {
            font-size: 2.5rem;
            margin-bottom: 8px;
        }

        .journal-overlay span {
            font-size: 0.9rem;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .journal-content {
            padding: 20px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }

        .journal-title {
            font-size: 1rem;
            font-weight: 600;
            margin: 0 0 15px 0;
            line-height: 1.4;
            flex-grow: 1;
            min-height: 2.8em;
        }

        .journal-title a {
            color: #2c3e50;
            text-decoration: none;
            transition: color 0.3s ease;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .journal-title a:hover {
            color: #0B2C3D;
            text-decoration: none;
        }

        .journal-badges {
            margin-bottom: 15px;
            min-height: 20px;
        }

        .journal-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 10px;
        }

        .btn-journal-visit,
        .btn-journal-info {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            text-decoration: none;
            transition: all 0.3s ease;
            font-size: 1rem;
        }

        .btn-journal-visit {
            background: linear-gradient(135deg, #0B2C3D 0%, #2A4C5D 100%);
            color: white;
        }

        .btn-journal-visit:hover {
            background: linear-gradient(135deg, #1B3C4D 0%, #3A5C6D 100%);
            color: white;
            transform: scale(1.1);
            text-decoration: none;
        }

        .btn-journal-info {
            background: rgba(11, 44, 61, 0.1);
            color: #0B2C3D;
        }

        .btn-journal-info:hover {
            background: rgba(11, 44, 61, 0.2);
            color: #0B2C3D;
            transform: scale(1.1);
            text-decoration: none;
        }

        /* Gallery Grid Enhancement */
        .ltn__gallery-active.row {
            --bs-gutter-x: 1.5rem;
            --bs-gutter-y: 1.5rem;
        }

        /* Section Title Enhancement */
        .section-title-area .section-subtitle {
            color: #0B2C3D !important;
        }

        .section-title-area .section-title {
            color: #2c3e50;
        }

        /* Filter Buttons Enhancement */
        .ltn__gallery-filter-menu button {
            background: rgba(11, 44, 61, 0.1);
            color: #0B2C3D;
            border: 1px solid rgba(11, 44, 61, 0.2);
            padding: 8px 16px;
            margin: 0 5px 10px 0;
            border-radius: 25px;
            transition: all 0.3s ease;
            font-weight: 500;
            font-size: 0.85rem;
        }

        .ltn__gallery-filter-menu button:hover,
        .ltn__gallery-filter-menu button.active {
            background: linear-gradient(135deg, #0B2C3D 0%, #2A4C5D 100%);
            color: white;
            border-color: #0B2C3D;
            transform: translateY(-2px);
        }

        /* Responsive Design */
        @media (max-width: 1199px) {
            .journal-image-wrapper {
                height: 250px;
            }
        }

        @media (max-width: 991px) {
            .journal-image-wrapper {
                height: 220px;
            }
            
            .journal-content {
                padding: 15px;
            }
        }

        @media (max-width: 767px) {
            .journal-image-wrapper {
                height: 280px;
            }
            
            .journal-title {
                font-size: 0.95rem;
            }
        }

        /* Enhanced Footer Styles */
        .enhanced-footer {
            background: linear-gradient(135deg, #0B2C3D 0%, #1B3C4D 50%, #2A4C5D 100%);
            color: #ffffff;
            margin-top: 60px;
        }

        .footer-main {
            padding: 60px 0 40px;
            position: relative;
        }

        .footer-main::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: 
                radial-gradient(circle at 20% 80%, rgba(255, 255, 255, 0.03) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(255, 255, 255, 0.03) 0%, transparent 50%);
            pointer-events: none;
        }

        .footer-logo-img {
            max-height: 50px;
            width: auto;
        }

        .footer-title {
            color: #ffffff;
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 20px;
            position: relative;
            padding-bottom: 10px;
        }

        .footer-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 40px;
            height: 2px;
            background: linear-gradient(90deg, #ffffff, rgba(255, 255, 255, 0.3));
            border-radius: 2px;
        }

        .footer-description {
            color: rgba(255, 255, 255, 0.85);
            line-height: 1.7;
            margin-bottom: 25px;
            font-size: 0.95rem;
        }

        .footer-social {
            display: flex;
            gap: 12px;
        }

        .social-link {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            background: rgba(255, 255, 255, 0.1);
            color: #ffffff;
            border-radius: 50%;
            text-decoration: none;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .social-link:hover {
            background: rgba(255, 255, 255, 0.2);
            color: #ffffff;
            transform: translateY(-2px);
            text-decoration: none;
        }

        .footer-menu {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .footer-menu li {
            margin-bottom: 10px;
        }

        .footer-menu li a {
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            transition: all 0.3s ease;
            font-size: 0.9rem;
            display: block;
            padding: 5px 0;
        }

        .footer-menu li a:hover {
            color: #ffffff;
            text-decoration: none;
            padding-left: 5px;
        }

        .contact-info .contact-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 20px;
        }

        .contact-icon {
            width: 20px;
            height: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            margin-top: 2px;
            flex-shrink: 0;
        }

        .contact-icon i {
            color: rgba(255, 255, 255, 0.8);
            font-size: 0.9rem;
        }

        .contact-text {
            flex: 1;
        }

        .contact-text p,
        .contact-text a {
            color: rgba(255, 255, 255, 0.85);
            margin: 0;
            line-height: 1.6;
            font-size: 0.9rem;
        }

        .contact-text a {
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .contact-text a:hover {
            color: #ffffff;
            text-decoration: none;
        }

        .footer-bottom {
            background: rgba(0, 0, 0, 0.2);
            padding: 20px 0;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }

        .copyright-text p {
            margin: 0;
            color: rgba(255, 255, 255, 0.7);
            font-size: 0.85rem;
        }

        .footer-bottom-links {
            display: flex;
            gap: 20px;
            justify-content: flex-end;
        }

        .footer-bottom-links a {
            color: rgba(255, 255, 255, 0.7);
            text-decoration: none;
            font-size: 0.85rem;
            transition: color 0.3s ease;
        }

        .footer-bottom-links a:hover {
            color: #ffffff;
            text-decoration: none;
        }

        /* Responsive Footer Design */
        @media (max-width: 991px) {
            .footer-main {
                padding: 50px 0 30px;
            }
            
            .footer-bottom-links {
                justify-content: flex-start;
                margin-top: 15px;
            }
        }

        @media (max-width: 767px) {
            .footer-main {
                padding: 40px 0 25px;
            }
            
            .footer-title {
                font-size: 1.1rem;
                margin-bottom: 15px;
            }
            
            .footer-description {
                font-size: 0.9rem;
                margin-bottom: 20px;
            }
            
            .footer-social {
                justify-content: flex-start;
                margin-bottom: 30px;
            }
            
            .social-link {
                width: 35px;
                height: 35px;
            }
            
            .footer-bottom-links {
                flex-direction: column;
                gap: 10px;
                margin-top: 10px;
            }
            
            .contact-item {
                margin-bottom: 15px;
            }
        }
    </style>
</head>

<body>
    <!--[if lte IE 9]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
    <![endif]-->

    <!-- Add your site or application content here -->

    <!-- Body main wrapper start -->
    <div class="body-wrapper">

        <!-- HEADER AREA START (header-5) -->
        <header class="ltn__header-area ltn__header-5 ltn__header-transparent--- gradient-color-4---">
            <!-- ltn__header-top-area start -->
            <div class="ltn__header-top-area section-bg-1 top-area-color-white---"
                style="padding-top: 20px; padding-bottom: 20px;">
                <div class="container">
                    <div class="row">
                        <div class="col-md-7">
                            <div class="ltn__top-bar-menu">


                                <div class="site-logo-wrap">
                                    <div class="site-logo">
                                        <a href="index.html"><img
                                                src="https://rumahjurnal.uinbukittinggi.ac.id/storage/setting/logo.png"
                                                alt="Logo" style="height: 60px;"></a>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <!-- ltn__header-top-area end -->

            <!-- ltn__header-middle-area start -->
            <div class="ltn__header-middle-area ltn__header-sticky ltn__sticky-bg-white">
                <div class="container">
                    <div class="row">
                        <div class="col header-menu-column">
                            <div class="header-menu d-none d-xl-block">
                                <nav>
                                    <div class="ltn__main-menu">
                                        <ul>
                                            <li><a href="#">Home</a></li>
                                            <li><a href="https://ejournal.uinbukittinggi.ac.id/index.php/index/about">About
                                                    Us</a></li>
                                            <li><a href="#journal">All journal</a></li>
                                            <li><a
                                                    href="https://ejournal.uinbukittinggi.ac.id/index.php/index/search">Search</a>
                                            </li>
                                            <li><a href="#contact">Contact</a></li>
                                            <li><a href="#journal">Login</a></li>
                                        </ul>
                                    </div>
                                </nav>
                            </div>
                        </div>
                        <div class="ltn__header-options ltn__header-options-2 mb-sm-20">
                            <!-- header-search-1 -->
                            <div class="header-search-wrap">
                                <div class="header-search-1">
                                    <div class="search-icon">
                                        <i class="icon-search for-search-show"></i>
                                        <i class="icon-cancel  for-search-close"></i>
                                    </div>
                                </div>
                                <div class="header-search-1-form">
                                    <form id="#" method="get" action="#">
                                        <input type="text" name="search" value="" placeholder="Search here..." />
                                        <button type="submit">
                                            <span><i class="icon-search"></i></span>
                                        </button>
                                    </form>
                                </div>
                            </div>
                            <!-- user-menu -->
                            <div class="ltn__drop-menu user-menu">
                                <ul>
                                    <li>
                                        <a href="#"><i class="icon-user"></i></a>
                                        <ul>
                                            <li><a href="login.html">Sign in</a></li>
                                            <li><a href="register.html">Register</a></li>
                                            <li><a href="account.html">My Account</a></li>
                                            <li><a href="wishlist.html">Wishlist</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>

                            <!-- mini-cart -->
                            <!-- Mobile Menu Button -->
                            <div class="mobile-menu-toggle d-xl-none">
                                <a href="#ltn__utilize-mobile-menu" class="ltn__utilize-toggle">
                                    <svg viewBox="0 0 800 600">
                                        <path
                                            d="M300,220 C300,220 520,220 540,220 C740,220 640,540 520,420 C440,340 300,200 300,200"
                                            id="top"></path>
                                        <path d="M300,320 L540,320" id="middle"></path>
                                        <path
                                            d="M300,210 C300,210 520,210 540,210 C740,210 640,530 520,410 C440,330 300,190 300,190"
                                            id="bottom"
                                            transform="translate(480, 320) scale(1, -1) translate(-480, -318) "></path>
                                    </svg>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ltn__header-middle-area end -->


        </header>
        <!-- HEADER AREA END -->


        <!-- Utilize Mobile Menu Start -->
        <div id="ltn__utilize-mobile-menu" class="ltn__utilize ltn__utilize-mobile-menu">
            <div class="ltn__utilize-menu-inner ltn__scrollbar">
                <div class="ltn__utilize-menu-head">
                    <div class="site-logo">
                        <a href="index.html"><img src="img/logo.png" alt="Logo"></a>
                    </div>
                    <button class="ltn__utilize-close">×</button>
                </div>
                <div class="ltn__utilize-menu-search-form">
                    <form action="#">
                        <input type="text" placeholder="Search...">
                        <button><i class="fas fa-search"></i></button>
                    </form>
                </div>
                <div class="ltn__utilize-menu">
                    <ul>
                        <li><a href="#">Home</a>
                            <ul class="sub-menu">
                                <li><a href="index.html">Home Style 01</a></li>
                                <li><a href="index-2.html">Home Style 02</a></li>
                            </ul>
                        </li>
                        <li><a href="#">About</a>
                            <ul class="sub-menu">
                                <li><a href="about.html">About</a></li>
                                <li><a href="service.html">Services</a></li>
                                <li><a href="service-details.html">Service Details</a></li>
                                <li><a href="portfolio.html">Portfolio</a></li>
                                <li><a href="portfolio-2.html">Portfolio - 02</a></li>
                                <li><a href="portfolio-details.html">Portfolio Details</a></li>
                                <li><a href="team.html">Team</a></li>
                                <li><a href="team-details.html">Team Details</a></li>
                                <li><a href="faq.html">FAQ</a></li>
                                <li><a href="locations.html">Google Map Locations</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Shop</a>
                            <ul class="sub-menu">
                                <li><a href="shop.html">Shop</a></li>
                                <li><a href="shop-grid.html">Shop Grid</a></li>
                                <li><a href="shop-left-sidebar.html">Shop Left sidebar</a></li>
                                <li><a href="shop-right-sidebar.html">Shop right sidebar</a></li>
                                <li><a href="product-details.html">Shop details </a></li>
                                <li><a href="cart.html">Cart</a></li>
                                <li><a href="wishlist.html">Wishlist</a></li>
                                <li><a href="checkout.html">Checkout</a></li>
                                <li><a href="order-tracking.html">Order Tracking</a></li>
                                <li><a href="account.html">My Account</a></li>
                                <li><a href="login.html">Sign in</a></li>
                                <li><a href="register.html">Register</a></li>
                            </ul>
                        </li>
                        <li><a href="#">News</a>
                            <ul class="sub-menu">
                                <li><a href="blog.html">News</a></li>
                                <li><a href="blog-grid.html">News Grid</a></li>
                                <li><a href="blog-left-sidebar.html">News Left sidebar</a></li>
                                <li><a href="blog-right-sidebar.html">News Right sidebar</a></li>
                                <li><a href="blog-details.html">News details</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Pages</a>
                            <ul class="sub-menu">
                                <li><a href="about.html">About</a></li>
                                <li><a href="service.html">Services</a></li>
                                <li><a href="service-details.html">Service Details</a></li>
                                <li><a href="portfolio.html">Portfolio</a></li>
                                <li><a href="portfolio-2.html">Portfolio - 02</a></li>
                                <li><a href="portfolio-details.html">Portfolio Details</a></li>
                                <li><a href="team.html">Team</a></li>
                                <li><a href="team-details.html">Team Details</a></li>
                                <li><a href="faq.html">FAQ</a></li>
                                <li><a href="history.html">History</a></li>
                                <li><a href="add-listing.html">Add Listing</a></li>
                                <li><a href="locations.html">Google Map Locations</a></li>
                                <li><a href="404.html">404</a></li>
                                <li><a href="contact.html">Contact</a></li>
                                <li><a href="coming-soon.html">Coming Soon</a></li>
                            </ul>
                        </li>
                        <li><a href="contact.html">Contact</a></li>
                    </ul>
                </div>
                <div class="ltn__utilize-buttons ltn__utilize-buttons-2">
                    <ul>
                        <li>
                            <a href="account.html" title="My Account">
                                <span class="utilize-btn-icon">
                                    <i class="far fa-user"></i>
                                </span>
                                My Account
                            </a>
                        </li>
                        <li>
                            <a href="wishlist.html" title="Wishlist">
                                <span class="utilize-btn-icon">
                                    <i class="far fa-heart"></i>
                                    <sup>3</sup>
                                </span>
                                Wishlist
                            </a>
                        </li>
                        <li>
                            <a href="cart.html" title="Shoping Cart">
                                <span class="utilize-btn-icon">
                                    <i class="fas fa-shopping-cart"></i>
                                    <sup>5</sup>
                                </span>
                                Shoping Cart
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="ltn__social-media-2">
                    <ul>
                        <li><a href="#" title="Facebook"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href="#" title="Twitter"><i class="fab fa-twitter"></i></a></li>
                        <li><a href="#" title="Linkedin"><i class="fab fa-linkedin"></i></a></li>
                        <li><a href="#" title="Instagram"><i class="fab fa-instagram"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Utilize Mobile Menu End -->

        <div class="ltn__utilize-overlay"></div>

        <!-- SLIDER AREA START (slider-3) -->
        <div class="ltn__slider-area ltn__slider-3  section-bg-1">
            <div class="ltn__slide-one-active slick-slide-arrow-1 slick-slide-dots-1" id="banner">

            </div>
        </div>
        <!-- SLIDER AREA END -->



        <!-- TEAM AREA START (Team - 3) -->
        <div class="ltn__team-area pt-120 pb-90---">
            <div class="" style="margin-left: 30px; margin-right: 30px;">

                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title-area ltn__section-title-2 text-center">
                            <h6 id="#journal" class="section-subtitle ltn__secondary-color"><span><i
                                        class="fas fa-square-full"></i></span> Our Journal</h6>
                            <h1 class="section-title">Publish Your Article in the Our Journals</h1>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__gallery-menu">
                            <div class="ltn__gallery-filter-menu portfolio-filter text-uppercase mb-50">
                                <button data-filter="*" class="active">all</button>
                                <button data-filter=".SCOPUS">Scopus</button>
                                <button data-filter=".SINTA-1">Sinta 1</button>
                                <button data-filter=".SINTA-2">Sinta 2</button>
                                <button data-filter=".SINTA-3">Sinta 3</button>
                                <button data-filter=".SINTA-4">Sinta 4</button>
                                <button data-filter=".SINTA-5">Sinta 5</button>
                                <button data-filter=".SINTA-6">Sinta 6</button>
                                <button data-filter=".WOS">Wos</button>
                                <button data-filter=".DOAJ">DOAJ</button>
                                <button data-filter=".MORAREF">MORAREF</button>
                                <button data-filter=".GARUDA">GARUDA</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Portfolio Wrapper Start-->
                {if !$journals|@count}
                {translate key="site.noJournals"}
                {else}


                <div class="ltn__gallery-active row ltn__gallery-style-1 justify-content-center">
                    <div class="ltn__gallery-sizer col-1"></div>

                    {foreach from=$journals item=journal}

                    {capture assign="url"}{url journal=$journal->getPath()}{/capture}
                    {assign var="thumb" value=$journal->getLocalizedData('journalThumbnail')}
                    {assign var="description" value=$journal->getLocalizedDescription()}

                    <div class="ltn__gallery-item col-xl-2 col-lg-3 col-md-4 col-sm-6 col-12 mb-4" id="filter_{$journal->getPath()|escape}">
                        <div class="journal-card h-100">
                            <div class="journal-image-container">
                                <a href="#" data-toggle="modal" data-target="#{$journal->getPath()|escape}" class="journal-image-link">
                                    <div class="journal-image-wrapper">
                                        {if $thumb}
                                        <img src='{$journalFilesPath}{$journal->getId()}/{$thumb.uploadName|escape:"url"}'
                                            alt="{$journal->getLocalizedName()|escape}"
                                            class="journal-image">
                                        {else}
                                        <img src="https://res.cloudinary.com/duuawbwih/image/upload/v1747042342/Desain_tanpa_judul_1_nr0kdz.png"
                                            alt="{$journal->getLocalizedName()|escape}"
                                            class="journal-image">
                                        {/if}
                                        <div class="journal-overlay">
                                            <i class="fas fa-eye"></i>
                                            <span>View Details</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="journal-content">
                                <h4 class="journal-title">
                                    <a href="{$url|escape}" title="{$journal->getLocalizedName()|escape}">
                                        {$journal->getLocalizedName()|escape}
                                    </a>
                                </h4>
                                <div class="journal-badges" id="icon_{$journal->getPath()|escape}"></div>
                                <div class="journal-actions">
                                    <a href="{$url|escape}" class="btn-journal-visit" title="Visit Journal">
                                        <i class="fas fa-external-link-alt"></i>
                                    </a>
                                    <a href="#" data-toggle="modal" data-target="#{$journal->getPath()|escape}" class="btn-journal-info" title="View Info">
                                        <i class="fas fa-info-circle"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal -->
                    <div class="modal fade" id="{$journal->getPath()|escape}" tabindex="-1" role="dialog"
                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-xl" role="document">
                            <div class="modal-content journal-modal-content">
                                <div class="modal-header journal-modal-header">
                                    <h4 class="modal-title journal-modal-title">
                                        <i class="fas fa-book-open"></i> {$journal->getLocalizedName()|escape}
                                    </h4>
                                    <button type="button" class="close journal-modal-close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body journal-modal-body">
                                    <!-- TEAM DETAILS AREA START -->
                                    <div class="ltn__team-details-area ">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    <div class="ltn__team-details-member-info text-center ">
                                                        <div class="team-details-img">
                                                            {if $thumb}
                                                            <img src='{$journalFilesPath}{$journal->getId()}/{$thumb.uploadName|escape:"url"}'
                                                                alt="journal" style="width: 100%; height: auto; max-height: 300px; object-fit: cover;">
                                                            {else}
                                                            <img src="https://res.cloudinary.com/duuawbwih/image/upload/v1747042342/Desain_tanpa_judul_1_nr0kdz.png"
                                                                alt="journal" style="width: 100%; height: auto; max-height: 300px; object-fit: cover;">
                                                            {/if}
                                                        </div>
                                                        <h2>{$journal->getLocalizedName()|escape}</h2>
                                                        <div class="journal-badge-container mb-3">
                                                            <span class="badge" style="background: linear-gradient(135deg, #0B2C3D 0%, #2A4C5D 100%); color: white; margin-right: 8px;">Academic Journal</span>
                                                            <span class="badge" style="background: linear-gradient(135deg, #28a745 0%, #20c997 100%); color: white;">Open Access</span>
                                                        </div>
                                                        <div
                                                            class="widget-2 ltn__menu-widget ltn__menu-widget-2 text-uppercase">
                                                            <ul>
                                                                <li>
                                                                    <a href='{$url|escape}'>
                                                                        Visit Journal
                                                                        <span><i class="fas fa-arrow-right"></i></span>
                                                                    </a>
                                                                </li>
                                                                <li><a href="{url|escape journal=$journal->getPath() page="
                                                                        issue" op="current" }">
                                                                        Current Issue
                                                                        <span><i class="fas fa-arrow-right"></i></span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-8">
                                                    <div class="ltn__team-details-member-info-details">
                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                <div class="ltn__team-details-member-about">
                                                                    <ul>
                                                                        <li><strong>Journal Title:</strong>
                                                                            {$journal->getLocalizedName()|escape}</li>
                                                                        <li><strong>e-ISSN:</strong>{$journal->getSetting('onlineIssn')}
                                                                        </li>
                                                                        <li><strong>p-ISSN:</strong>{$journal->getSetting('printIssn')}
                                                                        </li>

                                                                        <li><strong>Editor In Chief:</strong><span
                                                                                id="editor_chief_{$journal->getPath()|escape}"></span>
                                                                        </li>
                                                                        <li><strong>Publication Fee:</strong> <span
                                                                                id="fee_{$journal->getPath()|escape}"></span>
                                                                        </li>
                                                                        <li><strong>Indexing:</strong> <span
                                                                                id="indexing_{$journal->getPath()|escape}"></span>
                                                                        </li>
                                                                        
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <p>{$description}</p>



                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- TEAM DETAILS AREA END -->
                                </div>
                            </div>
                        </div>
                    </div>

                    {/foreach}

                </div>

                {/if}
            </div>
        </div>
        <!-- TEAM AREA END -->

        <!-- FOOTER AREA START -->
        <footer class="enhanced-footer">
            <!-- Main Footer Content -->
            <div class="footer-main">
                <div class="container">
                    <div class="row">
                        <!-- About Section -->
                        <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                            <div class="footer-about">
                                <div class="footer-logo mb-3">
                                    <img src="https://rumahjurnal.uinbukittinggi.ac.id/storage/setting/logo.png" 
                                         alt="Rumah Jurnal UIN Bukittinggi" class="footer-logo-img">
                                </div>
                                <h5 class="footer-title">Rumah Jurnal UIN Bukittinggi</h5>
                                <p class="footer-description">
                                    Rumah Jurnal UIN Sjech M. Djamil Djambek Bukittinggi adalah portal publikasi ilmiah resmi 
                                    Universitas Islam Negeri Sjech M.Djamil Djambek Bukittinggi
                                </p>
                                <div class="footer-social">
                                    <a href="#" class="social-link" title="Facebook">
                                        <i class="fab fa-facebook-f"></i>
                                    </a>
                                    <a href="#" class="social-link" title="Twitter">
                                        <i class="fab fa-twitter"></i>
                                    </a>
                                    <a href="#" class="social-link" title="Instagram">
                                        <i class="fab fa-instagram"></i>
                                    </a>
                                    <a href="#" class="social-link" title="Youtube">
                                        <i class="fab fa-youtube"></i>
                                    </a>
                                    <a href="#" class="social-link" title="LinkedIn">
                                        <i class="fab fa-linkedin"></i>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <!-- Quick Links Section -->
                        <div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
                            <div class="footer-links">
                                <h5 class="footer-title">Quick Links</h5>
                                <ul class="footer-menu">
                                    <li><a href="#">Home</a></li>
                                    <li><a href="https://ejournal.uinbukittinggi.ac.id/index.php/index/about">About Us</a></li>
                                    <li><a href="#journal">All Journals</a></li>
                                    <li><a href="https://ejournal.uinbukittinggi.ac.id/index.php/index/search">Search</a></li>
                                    <li><a href="#contact">Contact</a></li>
                                </ul>
                            </div>
                        </div>

                        <!-- Journal Categories Section -->
                        <div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
                            <div class="footer-links">
                                <h5 class="footer-title">Categories</h5>
                                <ul class="footer-menu">
                                    <li><a href="#">Scopus Indexed</a></li>
                                    <li><a href="#">Sinta Indexed</a></li>
                                    <li><a href="#">DOAJ Listed</a></li>
                                    <li><a href="#">Open Access</a></li>
                                    <li><a href="#">Recent Issues</a></li>
                                </ul>
                            </div>
                        </div>

                        <!-- Contact Info Section -->
                        <div class="col-lg-4 col-md-6">
                            <div class="footer-contact">
                                <h5 class="footer-title">Contact Information</h5>
                                <div class="contact-info">
                                    <div class="contact-item">
                                        <div class="contact-icon">
                                            <i class="fas fa-map-marker-alt"></i>
                                        </div>
                                        <div class="contact-text">
                                            <p>Data Center Building, 2nd floor, State Islamic University of Sjech M. Djamil Djambek Bukittinggi. 
                                            Gurun Aua St, Kubang Putih, Banuhampu, Agam - West Sumatra - Indonesia.</p>
                                        </div>
                                    </div>
                                    <div class="contact-item">
                                        <div class="contact-icon">
                                            <i class="fas fa-phone"></i>
                                        </div>
                                        <div class="contact-text">
                                            <a href="tel:085278566869">085278566869</a>
                                        </div>
                                    </div>
                                    <div class="contact-item">
                                        <div class="contact-icon">
                                            <i class="fas fa-envelope"></i>
                                        </div>
                                        <div class="contact-text">
                                            <a href="mailto:rumahjurnal@uinbukittinggi.ac.id">rumahjurnal@uinbukittinggi.ac.id</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer Bottom -->
            <div class="footer-bottom">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <div class="copyright-text">
                                <p>&copy; <span class="current-year">2024</span> Rumah Jurnal UIN Sjech M. Djamil Djambek Bukittinggi. All Rights Reserved.</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="footer-bottom-links">
                                <a href="#">Privacy Policy</a>
                                <a href="#">Terms of Service</a>
                                <a href="#">Sitemap</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- FOOTER AREA END -->



    </div>
    <!-- Body main wrapper end -->



    <!-- All JS Plugins -->
    <script src="https://cdn.jsdelivr.net/gh/farinchan/ejournal-site@main/js/plugins.js"></script>
    <!-- Main JS -->
    <script src="https://cdn.jsdelivr.net/gh/farinchan/ejournal-site@main/js/main.js"></script>

    <script src="{$baseUrl}/plugins/themes/default/js/custom.js"></script>

    <!-- Footer Enhancement Script -->
    <script>
        // Set current year in footer
        document.addEventListener('DOMContentLoaded', function() {
            const currentYear = new Date().getFullYear();
            const yearSpan = document.querySelector('.current-year');
            if (yearSpan) {
                yearSpan.textContent = currentYear;
            }
        });
    </script>

</body>

</html>
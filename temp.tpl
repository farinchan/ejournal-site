{strip}
{* Determine whether a logo or title string is being displayed *}
{assign var="showingLogo" value=true}
{if !$displayPageHeaderLogo}
{assign var="showingLogo" value=false}
{/if}
{/strip}

<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta charset="{$defaultCharset|escape}">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        {$pageTitleTranslated|strip_tags}
        {* Add the journal name to the end of page titles *}
        {if $requestedPage|escape|default:"index" != 'index' && $currentContext && $currentContext->getLocalizedName()}
        | {$currentContext->getLocalizedName()}
        {/if}
    </title>

    {load_header context="frontend"}
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
            background: linear-gradient(145deg, #ffffff 0%, #fafbfc 100%);
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
            min-height: 24px;
            display: flex;
            flex-wrap: wrap;
            gap: 5px;
        }


        .journal-badges .badge {
            font-size: 0.7rem;
            padding: 4px 8px;
            border-radius: 12px;
            font-weight: 500;
            background: linear-gradient(135deg, #0B2C3D 0%, #2A4C5D 100%);
            color: white;
            border: none;
        }

        .journal-badges .badge.scopus {
            background: linear-gradient(135deg, #ff6b35 0%, #f7931e 100%);
        }

        .journal-badges .badge.sinta {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
        }

        .journal-badges .badge.doaj {
            background: linear-gradient(135deg, #007bff 0%, #0056b3 100%);
        }

        .journal-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 8px;
            margin-top: auto;
            padding-top: 10px;
        }

        .btn-journal-visit,
        .btn-journal-info {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            flex: 1;
            height: 38px;
            border-radius: 20px;
            text-decoration: none;
            transition: all 0.3s ease;
            font-size: 0.85rem;
            font-weight: 500;
            position: relative;
            overflow: hidden;
            border: none;
            cursor: pointer;
        }

        .btn-journal-visit {
            background: linear-gradient(135deg, #0B2C3D 0%, #2A4C5D 100%);
            color: white;
            box-shadow: 0 2px 8px rgba(11, 44, 61, 0.2);
        }

        .btn-journal-visit:hover {
            background: linear-gradient(135deg, #1B3C4D 0%, #3A5C6D 100%);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(11, 44, 61, 0.3);
            text-decoration: none;
        }

        .btn-journal-info {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            color: #0B2C3D;
            border: 1px solid rgba(11, 44, 61, 0.15);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        .btn-journal-info:hover {
            background: linear-gradient(135deg, #e9ecef 0%, #dee2e6 100%);
            color: #0B2C3D;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            text-decoration: none;
        }

        .btn-journal-visit i,
        .btn-journal-info i {
            margin-right: 6px;
            font-size: 0.8rem;
        }

        .btn-text {
            font-size: 0.8rem;
            font-weight: 500;
            letter-spacing: 0.3px;
        }

        /* Button ripple effect */
        .btn-journal-visit::before,
        .btn-journal-info::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            transform: translate(-50%, -50%);
            transition: width 0.3s ease, height 0.3s ease;
        }

        .btn-journal-visit:active::before {
            width: 100%;
            height: 100%;
        }

        .btn-journal-info::before {
            background: rgba(11, 44, 61, 0.1);
        }

        .btn-journal-info:active::before {
            width: 100%;
            height: 100%;
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

            .journal-actions {
                gap: 6px;
                flex-direction: column;
            }

            .btn-journal-visit,
            .btn-journal-info {
                width: 100%;
                height: 36px;
                font-size: 0.8rem;
            }

            .btn-journal-visit i,
            .btn-journal-info i {
                margin-right: 5px;
                font-size: 0.75rem;
            }

            .btn-text {
                font-size: 0.75rem;
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

        /* Hero Banner Styles */
        .hero-banner-area {
            position: relative;
            min-height: 100vh;
            display: flex;
            align-items: center;
            overflow: hidden;
            background: linear-gradient(135deg, #0B2C3D 0%, #1B3C4D 40%, #2A4C5D 70%, #3A5C6D 100%);
        }

        .hero-background {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #0B2C3D 0%, #1B3C4D 50%, #2A4C5D 100%);
            z-index: -2;
        }

        .hero-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background:
                radial-gradient(circle at 20% 80%, rgba(255, 255, 255, 0.08) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(255, 255, 255, 0.06) 0%, transparent 50%),
                radial-gradient(circle at 40% 40%, rgba(255, 255, 255, 0.04) 0%, transparent 30%);
            z-index: -1;
        }

        .hero-pattern {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image:
                radial-gradient(circle at 25% 25%, rgba(255, 255, 255, 0.03) 1px, transparent 1px),
                radial-gradient(circle at 75% 75%, rgba(255, 255, 255, 0.02) 1px, transparent 1px);
            background-size: 60px 60px;
            animation: floatPattern 25s ease-in-out infinite;
            opacity: 0.7;
        }

        @keyframes floatPattern {
            0%, 100% {
                transform: translateY(0px) translateX(0px);
            }
            25% {
                transform: translateY(-10px) translateX(5px);
            }
            50% {
                transform: translateY(-5px) translateX(-10px);
            }
            75% {
                transform: translateY(-15px) translateX(5px);
            }
        }

        .min-vh-70 {
            min-height: 70vh;
        }

        .hero-content {
            color: white;
            padding-right: 20px;
            animation: slideInLeft 1s ease-out;
        }

        @keyframes slideInLeft {
            from {
                opacity: 0;
                transform: translateX(-50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .hero-subtitle {
            margin-bottom: 25px;
            animation: fadeInUp 1s ease-out 0.2s both;
        }

        .hero-badge {
            background: rgba(255, 255, 255, 0.15);
            color: white;
            padding: 10px 20px;
            border-radius: 30px;
            font-size: 0.9rem;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .hero-badge:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: translateY(-2px);
            box-shadow: 0 6px 25px rgba(0, 0, 0, 0.15);
        }

        .hero-title {
            font-size: 3.5rem;
            font-weight: 800;
            line-height: 1.1;
            margin-bottom: 30px;
            color: white;
            animation: fadeInUp 1s ease-out 0.4s both;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
        }

        .hero-title .highlight {
            background: linear-gradient(135deg, #ffffff 0%, #e3f2fd 50%, #bbdefb 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            position: relative;
            font-weight: 900;
            display: inline-block;
            animation: shimmer 3s ease-in-out infinite;
        }

        @keyframes shimmer {
            0%, 100% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
        }

        .hero-description {
            font-size: 1.15rem;
            line-height: 1.8;
            margin-bottom: 40px;
            color: rgba(255, 255, 255, 0.9);
            max-width: 95%;
            font-weight: 400;
            animation: fadeInUp 1s ease-out 0.6s both;
        }

        .hero-stats {
            display: flex;
            gap: 40px;
            margin-bottom: 45px;
            flex-wrap: wrap;
            animation: fadeInUp 1s ease-out 0.8s both;
        }

        .stat-item {
            text-align: center;
            position: relative;
            padding: 20px;
            background: rgba(255, 255, 255, 0.08);
            border-radius: 15px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.3s ease;
            min-width: 120px;
        }

        .stat-item:hover {
            background: rgba(255, 255, 255, 0.12);
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        .stat-item::before {
            content: '';
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 30px;
            height: 2px;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.6), transparent);
            border-radius: 2px;
        }

        .stat-number {
            font-size: 2.8rem;
            font-weight: 800;
            color: white;
            line-height: 1;
            margin-bottom: 8px;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
            counter-reset: number;
        }

        .stat-label {
            font-size: 0.95rem;
            color: rgba(255, 255, 255, 0.85);
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .hero-actions {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            animation: fadeInUp 1s ease-out 1s both;
        }

        .btn-hero-primary,
        .btn-hero-secondary {
            display: inline-flex;
            align-items: center;
            gap: 12px;
            padding: 16px 32px;
            border-radius: 35px;
            font-weight: 600;
            font-size: 1rem;
            text-decoration: none;
            transition: all 0.4s ease;
            position: relative;
            overflow: hidden;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            box-shadow: 0 6px 25px rgba(0, 0, 0, 0.2);
        }

        .btn-hero-primary {
            background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 50%, #e9ecef 100%);
            color: #0B2C3D;
            box-shadow: 0 6px 25px rgba(255, 255, 255, 0.3);
        }

        .btn-hero-primary::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent);
            transition: left 0.5s ease;
        }

        .btn-hero-primary:hover {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 50%, #dee2e6 100%);
            color: #0B2C3D;
            transform: translateY(-3px);
            box-shadow: 0 10px 35px rgba(255, 255, 255, 0.4);
            text-decoration: none;
        }

        .btn-hero-primary:hover::before {
            left: 100%;
        }

        .btn-hero-secondary {
            background: transparent;
            color: white;
            border: 2px solid rgba(255, 255, 255, 0.3);
            backdrop-filter: blur(10px);
            position: relative;
        }

        .btn-hero-secondary::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 0;
            height: 100%;
            background: rgba(255, 255, 255, 0.1);
            transition: width 0.4s ease;
            z-index: -1;
        }

        .btn-hero-secondary:hover {
            color: white;
            border-color: rgba(255, 255, 255, 0.6);
            transform: translateY(-3px);
            text-decoration: none;
            box-shadow: 0 10px 35px rgba(0, 0, 0, 0.3);
        }

        .btn-hero-secondary:hover::before {
            width: 100%;
        }

        .hero-image {
            position: relative;
            text-align: center;
            animation: slideInRight 1s ease-out 0.5s both;
        }

        @keyframes slideInRight {
            from {
                opacity: 0;
                transform: translateX(50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .hero-image-wrapper {
            position: relative;
            display: inline-block;
            animation: heroFloat 8s ease-in-out infinite;
        }

        @keyframes heroFloat {
            0%, 100% {
                transform: translateY(0px) rotate(0deg);
            }
            25% {
                transform: translateY(-15px) rotate(1deg);
            }
            50% {
                transform: translateY(-25px) rotate(0deg);
            }
            75% {
                transform: translateY(-10px) rotate(-1deg);
            }
        }

        .hero-main-image {
            max-width: 450px;
            height: auto;
            filter: drop-shadow(0 15px 40px rgba(0, 0, 0, 0.3));
            transition: filter 0.3s ease;
        }

        .hero-main-image:hover {
            filter: drop-shadow(0 20px 50px rgba(0, 0, 0, 0.4));
        }

        .floating-element {
            position: absolute;
            width: 70px;
            height: 70px;
            background: rgba(255, 255, 255, 0.12);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.8rem;
            backdrop-filter: blur(15px);
            border: 2px solid rgba(255, 255, 255, 0.2);
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .floating-element:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: scale(1.1);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        .element-1 {
            top: 15%;
            left: -12%;
            animation: floatElement1 6s ease-in-out infinite;
        }

        .element-2 {
            top: 45%;
            right: -18%;
            animation: floatElement2 7s ease-in-out infinite;
        }

        .element-3 {
            bottom: 18%;
            left: 8%;
            animation: floatElement3 8s ease-in-out infinite;
        }

        @keyframes floatElement1 {
            0%, 100% {
                transform: translate(0, 0) rotate(0deg);
            }
            25% {
                transform: translate(15px, -20px) rotate(5deg);
            }
            50% {
                transform: translate(5px, -10px) rotate(-3deg);
            }
            75% {
                transform: translate(-10px, -25px) rotate(2deg);
            }
        }

        @keyframes floatElement2 {
            0%, 100% {
                transform: translate(0, 0) rotate(0deg);
            }
            25% {
                transform: translate(-12px, 18px) rotate(-4deg);
            }
            50% {
                transform: translate(-20px, 5px) rotate(6deg);
            }
            75% {
                transform: translate(-5px, 25px) rotate(-2deg);
            }
        }

        @keyframes floatElement3 {
            0%, 100% {
                transform: translate(0, 0) rotate(0deg);
            }
            25% {
                transform: translate(20px, -15px) rotate(3deg);
            }
            50% {
                transform: translate(10px, -25px) rotate(-5deg);
            }
            75% {
                transform: translate(25px, -5px) rotate(4deg);
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .hero-scroll-indicator {
            position: absolute;
            bottom: 40px;
            left: 50%;
            transform: translateX(-50%);
            text-align: center;
            color: rgba(255, 255, 255, 0.8);
            animation: bounceUpDown 2s infinite;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .hero-scroll-indicator:hover {
            color: white;
            transform: translateX(-50%) scale(1.1);
        }

        @keyframes bounceUpDown {
            0%, 20%, 50%, 80%, 100% {
                transform: translateX(-50%) translateY(0);
            }
            40% {
                transform: translateX(-50%) translateY(-15px);
            }
            60% {
                transform: translateX(-50%) translateY(-8px);
            }
        }

        .scroll-down span {
            font-size: 0.85rem;
            font-weight: 600;
            display: block;
            margin-bottom: 8px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .scroll-arrow {
            font-size: 1.4rem;
            animation: arrowBounce 1.5s infinite;
        }

        @keyframes arrowBounce {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(5px);
            }
        }

        /* Responsive Design for Hero */
        @media (max-width: 1199px) {
            .hero-title {
                font-size: 2.8rem;
            }

            .hero-main-image {
                max-width: 350px;
            }
        }

        @media (max-width: 991px) {
            .hero-banner-area {
                min-height: 80vh;
                padding: 80px 0 60px;
            }

            .hero-title {
                font-size: 2.4rem;
            }

            .hero-description {
                max-width: 100%;
            }

            .hero-stats {
                gap: 20px;
            }

            .stat-number {
                font-size: 2rem;
            }

            .hero-main-image {
                max-width: 300px;
                margin-top: 30px;
            }
        }

        @media (max-width: 767px) {
            .hero-title {
                font-size: 2rem;
                margin-bottom: 20px;
            }

            .hero-description {
                font-size: 1rem;
                margin-bottom: 25px;
            }

            .hero-stats {
                gap: 15px;
                justify-content: center;
                margin-bottom: 30px;
            }

            .stat-number {
                font-size: 1.8rem;
            }

            .stat-label {
                font-size: 0.8rem;
            }

            .hero-actions {
                justify-content: center;
            }

            .btn-hero-primary,
            .btn-hero-secondary {
                padding: 12px 24px;
                font-size: 0.9rem;
            }

            .hero-main-image {
                max-width: 250px;
            }

            .floating-element {
                width: 45px;
                height: 45px;
                font-size: 1.2rem;
            }
        }

        /* Enhanced Search Area Styles */
        .enhanced-search-area {
            position: relative;
            width: 100%;
            min-height: 60vh;
            background: linear-gradient(135deg, #0B2C3D 0%, #1B3C4D 50%, #2A4C5D 100%);
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 60px 0;
        }

        .enhanced-search-area.active {
            display: flex;
            align-items: center;
            justify-content: center;
            animation: fadeIn 0.3s ease-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        #particles-js {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 1;
            opacity: 0.6;
        }

        .search-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background:
                radial-gradient(circle at 20% 80%, rgba(255, 255, 255, 0.03) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(255, 255, 255, 0.03) 0%, transparent 50%);
            z-index: 2;
        }

        .search-container {
            position: relative;
            z-index: 3;
            width: 100%;
            padding: 30px 20px;
        }

        .search-content {
            animation: slideUp 0.5s ease-out 0.2s both;
        }

        @keyframes slideUp {
            from {
                transform: translateY(30px);
                opacity: 0;
            }

            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .search-header {
            margin-bottom: 30px;
        }

        .search-icon {
            font-size: 3rem;
            color: rgba(255, 255, 255, 0.9);
            margin-bottom: 15px;
            animation: pulse 2s ease-in-out infinite;
        }

        @keyframes pulse {

            0%,
            100% {
                transform: scale(1);
                opacity: 0.9;
            }

            50% {
                transform: scale(1.05);
                opacity: 1;
            }
        }

        .search-title {
            font-size: 2.2rem;
            font-weight: 700;
            color: white;
            margin-bottom: 10px;
            line-height: 1.2;
        }

        .search-subtitle {
            font-size: 1.1rem;
            color: rgba(255, 255, 255, 0.8);
            margin-bottom: 0;
            font-weight: 400;
        }

        .search-form-wrapper {
            margin-bottom: 30px;
        }

        .enhanced-search-form {
            max-width: 100%;
        }

        .search-input-group {
            display: flex;
            gap: 15px;
            margin-bottom: 25px;
            align-items: flex-start;
        }

        .search-input-wrapper {
            flex: 1;
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 20px;
            top: 50%;
            transform: translateY(-50%);
            color: rgba(11, 44, 61, 0.6);
            font-size: 1.1rem;
            z-index: 2;
        }

        .search-input {
            width: 100%;
            height: 60px;
            padding: 0 60px 0 55px;
            border: 2px solid rgba(255, 255, 255, 0.1);
            border-radius: 30px;
            background: rgba(255, 255, 255, 0.95);
            font-size: 1.1rem;
            color: #2c3e50;
            backdrop-filter: blur(10px);
            transition: all 0.3s ease;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
        }

        .search-input:focus {
            outline: none;
            border-color: rgba(255, 255, 255, 0.3);
            background: rgba(255, 255, 255, 1);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
            transform: translateY(-2px);
        }

        .search-input::placeholder {
            color: rgba(11, 44, 61, 0.6);
            font-weight: 400;
        }

        .search-btn {
            height: 60px;
            padding: 0 30px;
            border: none;
            border-radius: 30px;
            background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
            color: #0B2C3D;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 5px 20px rgba(255, 255, 255, 0.2);
            display: flex;
            align-items: center;
            gap: 10px;
            white-space: nowrap;
        }

        .search-btn:hover {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            transform: translateY(-2px);
            box-shadow: 0 8px 30px rgba(255, 255, 255, 0.3);
        }

        .search-filters {
            display: flex;
            justify-content: center;
        }

        .filter-group {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            justify-content: center;
        }

        .filter-label {
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
            color: rgba(255, 255, 255, 0.8);
            font-size: 0.95rem;
            font-weight: 500;
            transition: color 0.3s ease;
            user-select: none;
        }

        .filter-label:hover {
            color: white;
        }

        .filter-label input[type="radio"] {
            appearance: none;
            width: 18px;
            height: 18px;
            border: 2px solid rgba(255, 255, 255, 0.4);
            border-radius: 50%;
            position: relative;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .filter-label input[type="radio"]:checked {
            border-color: white;
            background: rgba(255, 255, 255, 0.1);
        }

        .filter-label input[type="radio"]:checked::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 8px;
            height: 8px;
            background: white;
            border-radius: 50%;
        }

        .search-stats {
            display: flex;
            justify-content: center;
            gap: 40px;
            flex-wrap: wrap;
        }

        .stat-item {
            text-align: center;
            color: white;
        }

        .stat-number {
            display: block;
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 5px;
            color: white;
        }

        .stat-label {
            font-size: 0.9rem;
            color: rgba(255, 255, 255, 0.8);
            font-weight: 500;
        }

        .search-close-btn {
            display: none;
            /* Hide close button since it's not a modal anymore */
        }

        .search-suggestions {
            position: absolute;
            top: 100%;
            left: 0;
            right: 0;
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            margin-top: 5px;
            max-height: 200px;
            overflow-y: auto;
            z-index: 10;
            display: none;
        }

        /* Responsive Design for Search */
        @media (max-width: 991px) {
            .enhanced-search-area {
                min-height: 50vh;
                padding: 40px 0;
            }

            .search-title {
                font-size: 1.8rem;
            }

            .search-icon {
                font-size: 2.5rem;
            }

            .search-input-group {
                flex-direction: column;
                gap: 15px;
            }

            .search-btn {
                width: 100%;
                justify-content: center;
            }

            .search-stats {
                gap: 30px;
            }
        }

        @media (max-width: 767px) {
            .enhanced-search-area {
                min-height: 45vh;
                padding: 30px 0;
            }

            .search-title {
                font-size: 1.6rem;
            }

            .search-subtitle {
                font-size: 0.95rem;
            }

            .search-input {
                height: 50px;
                font-size: 1rem;
                padding: 0 50px 0 50px;
            }

            .input-icon {
                left: 18px;
                font-size: 1rem;
            }

            .search-btn {
                height: 50px;
                font-size: 0.9rem;
            }

            .filter-group {
                gap: 15px;
            }

            .filter-label {
                font-size: 0.85rem;
            }

            .search-stats {
                gap: 20px;
            }

            .stat-number {
                font-size: 1.4rem;
            }

            .search-header {
                margin-bottom: 20px;
            }

            .search-form-wrapper {
                margin-bottom: 20px;
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
                                        <a href="/">
                                            {if $displayPageHeaderLogo}
                                            <img src='{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}'
                                                alt="Logo" style="height: 60px;">
                                            {elseif $displayPageHeaderTitle}
                                            <h1 style="color: white; font-size: 24px; margin: 0;">
                                                {$displayPageHeaderTitle|escape}</h1>
                                            {else}
                                            <img src="{$baseUrl}/templates/images/structure/logo.png"
                                                alt="{$applicationName|escape}" style="height: 60px;">
                                            {/if}
                                        </a>
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
                                            <li><a href="/"><i class="fas fa-home"></i> Home</a></li>
                                            <li><a href="https://rumahjurnal.uinbukittinggi.ac.id/"><i class="fas fa-university"></i> Rumah Jurnal</a></li>
                                            <li><a href="#journal"><i class="fas fa-book"></i> All journal</a></li>
                                            <li>
                                                <a href="https://ejournal.uinbukittinggi.ac.id/index.php/index/search">
                                                    <i class="fas fa-search"></i> Search
                                                </a>
                                            </li>
                                            <li>
                                                <a href="https://rumahjurnal.uinbukittinggi.ac.id/contact">
                                                    <i class="fas fa-envelope"></i> Contact
                                                </a>
                                            </li>
                                            {if !$isUserLoggedIn}
                                            <li>
                                                <a href="{$baseUrl}/index.php/index/login">
                                                    <i class="fas fa-sign-in-alt"></i> Login
                                                </a>
                                            </li>
                                            <li>
                                                <a href="{$baseUrl}/index.php/index/user/register">
                                                    <i class="fas fa-user-plus"></i> Register
                                                </a>
                                            </li>
                                            {else}
                                            <li>
                                                <a href="{$baseUrl}/index.php/index/submissions" class="dashboard-link">
                                                    <i class="fas fa-tachometer-alt"></i> Dashboard
                                                    {if $dashboardStats.unreadTasks > 0}
                                                    <span class="badge badge-notification">{$dashboardStats.unreadTasks}</span>
                                                    {/if}
                                                </a>
                                            </li>
                                            {if $isAdmin}
                                            <li>
                                                <a href="{$baseUrl}/index.php/index/admin" class="admin-link">
                                                    <i class="fas fa-cog"></i> Administrator
                                                </a>
                                            </li>
                                            {/if}
                                            {/if}
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
                                    <form id="#" method="get" action="/index.php/index/search">
                                        <input type="text" name="query" value="" placeholder="Search here..." />
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
                                            {if !$isUserLoggedIn}
                                            <li><a href="{$baseUrl}/index.php/index/login">Login</a></li>
                                            <li><a href="{$baseUrl}/index.php/index/user/register">Register</a></li>
                                            {else}
                                            <li><a href="{$baseUrl}/index/user/profile">Edit Profile</a></li>
                                            <li>
                                                <a href="{$baseUrl}/index.php/index/submissions" class="dashboard-link">
                                                    Dashboard
                                                    {if $dashboardStats.unreadTasks > 0}
                                                    <span
                                                        class="badge badge-notification">{$dashboardStats.unreadTasks}</span>
                                                    {/if}
                                                </a>
                                            </li>
                                            {if $isAdmin}
                                            <li><a href="{$baseUrl}/index.php/index/admin" class="admin-link">
                                                    <i class="fas fa-cog"></i> Administrator
                                                </a></li>
                                            {/if}
                                            <li><a href="{$baseUrl}/index.php/index/login/signOut">Logout</a></li>
                                            {/if}

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
                        <a href="/">
                            {if $displayPageHeaderLogo}
                            <img src='{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}' alt="Logo">
                            {elseif $displayPageHeaderTitle}
                            <h1 style="color: white; font-size: 24px; margin: 0;">
                                {$displayPageHeaderTitle|escape}</h1>
                            {else}
                            <img src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}">
                            {/if}
                        </a>
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
                        <li><a href="/">Home</a></li>
                        <li><a href="https://rumahjurnal.uinbukittinggi.ac.id/">Rumah Jurnal</a></li>
                        <li><a href="#journal">All journal</a></li>
                        <li><a href="https://ejournal.uinbukittinggi.ac.id/index.php/index/search">Search</a></li>
                        <li><a href="https://rumahjurnal.uinbukittinggi.ac.id/contact">Contact</a></li>
                    </ul>
                </div>
                <div class="ltn__utilize-buttons ltn__utilize-buttons-2">
                    <ul>
                        {if !$isUserLoggedIn}
                        <li>
                            <a href="{$baseUrl}/index.php/index/login" title="My Account">
                                <span class="utilize-btn-icon">
                                    <i class="far fa-user"></i>
                                </span>
                                Login
                            </a>
                        </li>
                        <li>
                            <a href="{$baseUrl}/index.php/index/user/register" title="Register">
                                <span class="utilize-btn-icon">
                                    <i class="fas fa-user-plus"></i>
                                </span>
                                Register
                            </a>
                        </li>
                        {else}
                        <li>
                            <a href="{$baseUrl}/index/user/profile"></a>
                            <span class="utilize-btn-icon">
                                <i class="far fa-user"></i>
                            </span>
                            Edit Profile
                            </a>
                        </li>
                        <li>
                            <a href="{$baseUrl}/index.php/index/submissions" class="dashboard-link">
                                <span class="utilize-btn-icon">
                                    <i class="far fa-tachometer-alt"></i>
                                    {if $dashboardStats.unreadTasks > 0}
                                    <sup class="badge badge-notification">{$dashboardStats.unreadTasks}</sup>
                                    {/if}
                                </span>
                                Dashboard
                            </a>
                        </li>
                        <li>
                            <a href="{$baseUrl}/index.php/index/login/signOut">
                                <span class="utilize-btn-icon">
                                    <i class="fas fa-sign-out-alt"></i>
                                </span>
                                Logout
                            </a>
                        </li>
                        {/if}


                    </ul>
                </div>
            </div>
        </div>
        <!-- Utilize Mobile Menu End -->


        <!-- ENHANCED SEARCH AREA START -->
        <div class="enhanced-search-area">
            <div id="particles-js"></div>
            <div class="search-overlay"></div>
            <div class="search-container">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8 col-md-10">
                            <div class="search-content text-center">
                                <div class="search-header">
                                    <i class="fas fa-search search-icon"></i>
                                    <h2 class="search-title">Search Academic Resources</h2>
                                    <p class="search-subtitle">Discover thousands of academic articles, journals, and
                                        research papers</p>
                                </div>
                                <div class="search-form-wrapper">
                                    <form action="/index.php/index/search" method="get" class="enhanced-search-form">
                                        <div class="search-input-group">
                                            <div class="search-input-wrapper">
                                                <input type="text" name="query" class="search-input"
                                                    placeholder="Search by title, author, subject, or keywords..."
                                                    autocomplete="off">
                                                <div class="search-suggestions" id="searchSuggestions"></div>
                                            </div>
                                            <button type="submit" class="search-btn">
                                                <i class="fas fa-arrow-right"></i>
                                                <span>Search</span>
                                            </button>
                                        </div>

                                    </form>
                                </div>
                                <div class="search-stats">
                                    <div class="stat-item">
                                        <span class="stat-number">500+</span>
                                        <span class="stat-label">Articles</span>
                                    </div>
                                    <div class="stat-item">
                                        <span class="stat-number">25+</span>
                                        <span class="stat-label">Journals</span>
                                    </div>
                                    <div class="stat-item">
                                        <span class="stat-number">100+</span>
                                        <span class="stat-label">Authors</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ENHANCED SEARCH AREA END -->

        <!-- HERO BANNER AREA START -->
        <!-- <div class="hero-banner-area">
            <div class="hero-background">
                <div class="hero-overlay"></div>
                <div class="hero-pattern"></div>
            </div>
            <div class="container">
                <div class="row align-items-center min-vh-70">
                    <div class="col-lg-7 col-md-6">
                        <div class="hero-content">
                            <div class="hero-subtitle">
                                <span class="badge hero-badge">
                                    <i class="fas fa-graduation-cap"></i>
                                    Rumah Jurnal UIN Sjech M. Djamil Djambek Bukittinggi
                                </span>
                            </div>
                            <h1 class="hero-title">
                                Welcome to <span class="highlight">E-Journal</span><br>
                                UIN Sjech M. Djamil Djambek Bukittinggi
                            </h1>
                            <p class="hero-description">
                                The official scientific publication portal providing open access to high-quality
                                journals in Islamic studies, science, technology, and humanities.
                            </p>
                            <div class="hero-stats">
                                <div class="stat-item">
                                    <div class="stat-number" data-count="25">0</div>
                                    <div class="stat-label">Active Journals</div>
                                </div>
                                <div class="stat-item">
                                    <div class="stat-number" data-count="500">0</div>
                                    <div class="stat-label">Published Articles</div>
                                </div>
                                <div class="stat-item">
                                    <div class="stat-number" data-count="15">0</div>
                                    <div class="stat-label">Indexed Journals</div>
                                </div>
                            </div>
                            <div class="hero-actions">
                                <a href="#journal" class="btn-hero-primary">
                                    <i class="fas fa-book-reader"></i>
                                    Browse Journals
                                </a>
                                <a href="https://ejournal.uinbukittinggi.ac.id/index.php/index/search"
                                    class="btn-hero-secondary">
                                    <i class="fas fa-search"></i>
                                    Search Articles
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-6">
                        <div class="hero-image">
                            <div class="hero-image-wrapper">
                                <img src="https://res.cloudinary.com/duuawbwih/image/upload/v1747042342/Desain_tanpa_judul_1_nr0kdz.png"
                                    alt="Academic Publications" class="img-fluid hero-main-image">
                                <div class="floating-element element-1">
                                    <i class="fas fa-book"></i>
                                </div>
                                <div class="floating-element element-2">
                                    <i class="fas fa-microscope"></i>
                                </div>
                                <div class="floating-element element-3">
                                    <i class="fas fa-globe"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero-scroll-indicator">
                <div class="scroll-down">
                    <span>Scroll Down</span>
                    <div class="scroll-arrow">
                        <i class="fas fa-chevron-down"></i>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- HERO BANNER AREA END -->



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
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="ltn__gallery-menu text-center">
                            <div class="ltn__gallery-filter-menu portfolio-filter text-uppercase mb-50 d-inline-block">
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
                                <button data-filter=".EBSCO">EBSCO</button>
                                <button data-filter=".COPERNICUS">COPERNICUS</button>
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

                    <div class="ltn__gallery-item col-xl-2 col-lg-3 col-md-4 col-sm-6 col-12 mb-4"
                        id="filter_{$journal->getPath()|escape}">
                        <div class="journal-card h-100">
                            <div class="journal-image-container">
                                <a href="#" data-toggle="modal" data-target="#{$journal->getPath()|escape}"
                                    class="journal-image-link">
                                    <div class="journal-image-wrapper">
                                        {if $thumb}
                                        <img src='{$journalFilesPath}{$journal->getId()}/{$thumb.uploadName|escape:"url"}'
                                            alt="{$journal->getLocalizedName()|escape}" class="journal-image">
                                        {else}
                                        <img src="https://res.cloudinary.com/duuawbwih/image/upload/v1747042342/Desain_tanpa_judul_1_nr0kdz.png"
                                            alt="{$journal->getLocalizedName()|escape}" class="journal-image">
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
                                        <span class="btn-text">Visit</span>
                                    </a>
                                    <a href="#" data-toggle="modal" data-target="#{$journal->getPath()|escape}"
                                        class="btn-journal-info" title="View Info">
                                        <i class="fas fa-info-circle"></i>
                                        <span class="btn-text">Details</span>
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
                                    <button type="button" class="close journal-modal-close" data-dismiss="modal"
                                        aria-label="Close">
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
                                                                alt="journal"
                                                                style="width: 100%; height: auto; max-height: 300px; object-fit: cover;">
                                                            {else}
                                                            <img src="https://res.cloudinary.com/duuawbwih/image/upload/v1747042342/Desain_tanpa_judul_1_nr0kdz.png"
                                                                alt="journal"
                                                                style="width: 100%; height: auto; max-height: 300px; object-fit: cover;">
                                                            {/if}
                                                        </div>
                                                        <h2>{$journal->getLocalizedName()|escape}</h2>
                                                        <div class="journal-badge-container mb-3">
                                                            <span class="badge"
                                                                style="background: linear-gradient(135deg, #0B2C3D 0%, #2A4C5D 100%); color: white; margin-right: 8px;">Academic
                                                                Journal</span>
                                                            <span class="badge"
                                                                style="background: linear-gradient(135deg, #28a745 0%, #20c997 100%); color: white;">Open
                                                                Access</span>
                                                        </div>
                                                        <div
                                                            class="widget-2 ltn__menu-widget ltn__menu-widget-2 text-uppercase">
                                                            <ul>
                                                                <li>
                                                                    <a href="{$url|escape}"
                                                                        class="d-flex align-items-center py-2 px-3 rounded mb-2"
                                                                        style="background: linear-gradient(135deg, #0B2C3D 0%, #2A4C5D 100%); color: #fff; font-weight: 500;">
                                                                        <i class="fas fa-external-link-alt mr-2"></i>
                                                                        Visit Journal
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="{url journal=$journal->getPath() page='issue' op='current'}"
                                                                        class="d-flex align-items-center py-2 px-3 rounded"
                                                                        style="background: linear-gradient(135deg, #28a745 0%, #20c997 100%); color: #fff; font-weight: 500;">
                                                                        <i class="fas fa-book mr-2"></i> Current Issue
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
                                    {if $displayPageHeaderLogo}
                                    <img src='{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}'
                                        alt="Logo" class="footer-logo-img">
                                    {elseif $displayPageHeaderTitle}
                                    <h1 style="color: white; font-size: 24px; margin: 0;">
                                        {$displayPageHeaderTitle|escape}</h1>
                                    {else}
                                    <img src="{$baseUrl}/templates/images/structure/logo.png"
                                        alt="{$applicationName|escape}" class="footer-logo-img">
                                    {/if}

                                </div>
                                <h5 class="footer-title">E-Journal UIN Bukittinggi</h5>
                                <p class="footer-description">
                                    E-Journal UIN Sjech M. Djamil Djambek Bukittinggi is the official scientific
                                    publication portal of the State Islamic University of Sjech M. Djamil Djambek
                                    Bukittinggi.
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
                                    <li><a href="/">Home</a></li>
                                    </li>
                                    <li><a href="#journal">All journal</a></li>
                                    <li><a
                                            href="https://ejournal.uinbukittinggi.ac.id/index.php/index/search">Search</a>
                                    </li>
                                    <li><a href="https://rumahjurnal.uinbukittinggi.ac.id/contact">Contact</a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!-- Journal Categories Section -->
                        <div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
                            <div class="footer-links">
                                <h5 class="footer-title">External Links</h5>
                                <ul class="footer-menu">
                                    <li><a href="https://uinbukittinggi.ac.id/">UIN Bukittinggi</a></li>
                                    <li><a href="https://rumahjurnal.uinbukittinggi.ac.id/">Rumah Jurnal</a></li>
                                    <li><a href="https://proceedings.uinbukittinggi.ac.id/">Proceeding</a></li>
                                    <li><a href="">StudentResearchHub</a></li>

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
                                            <p>Data Center Building, 2nd floor, State Islamic University of Sjech M.
                                                Djamil Djambek Bukittinggi.
                                                Gurun Aua St, Kubang Putih, Banuhampu, Agam - West Sumatra - Indonesia.
                                            </p>
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
                                            <a
                                                href="mailto:rumahjurnal@uinbukittinggi.ac.id">rumahjurnal@uinbukittinggi.ac.id</a>
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
                                <p>&copy; <span class="current-year">2025</span> Rumah Jurnal UIN Sjech M. Djamil
                                    Djambek Bukittinggi. All Rights Reserved.</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="footer-bottom-links">
                                <a href="https://rumahjurnal.uinbukittinggi.ac.id/privacy-policy">Privacy Policy</a>
                                <a href="https://rumahjurnal.uinbukittinggi.ac.id/terms-of-service">Terms of Service</a>
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
    <!-- Particles.js -->
    <script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
    <!-- Particles App -->
    <!-- Particles App -->
    <script src="https://cdn.jsdelivr.net/gh/farinchan/ejournal-site@main/script_banner.js"></script>
    <script src="{$baseUrl}/plugins/themes/default/js/custom.js"></script>

    <script src="https://cdn.jsdelivr.net/gh/farinchan/ejournal-site@main/particle_custom3.js"></script>
    <!-- Enhanced Search Area Scripts -->
   


</body>

</html>
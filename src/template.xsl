<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


    <xsl:template match="items">
        <xsl:apply-templates select="//item[type='portfolio']"/>
    </xsl:template>


    <xsl:template match="item[type='portfolio']">
        <xsl:variable name="uri" select="concat(type, '-', title, '.html')"/>

        <xsl:call-template name="html-page">
            <xsl:with-param name="type" select="type"/>
            <xsl:with-param name="title" select="title"/>
            <xsl:with-param name="uri" select="$uri"/>
            <xsl:with-param name="content_id" select="content_id"/>
        </xsl:call-template>
    </xsl:template>


    <xsl:template name="portfolio-html-content">
        <xsl:param name="title"/>
        <xsl:param name="type"/>
        <xsl:param name="portfolio"/>

        <h1><xsl:value-of select="$title"/></h1>

        <xsl:variable name="ministers" select="//item[role_belongs_to=$portfolio and type='portfolio_role']"/>

        <xsl:if test="$ministers">

            <h2>Ministers</h2>

            <ul class="au-link-list">
                <xsl:for-each select="$ministers">
                    <xsl:sort select="importance"/>
                    <xsl:variable name="contact" select="contact"/>
                    <xsl:variable name="person" select="//item[type='person' and content_id=$contact]"/>
                    <li>
                        <a href="/">
                            <xsl:value-of select="title"/>
                        </a>
                        <br/>
                        <a href="/">
                            <xsl:value-of select="concat($person/salutation, ' ', $person/first_name, ' ', $person/last_name, ' ', $person/honorific)"/>
                        </a>
                    </li>
                </xsl:for-each>
            </ul>

        </xsl:if>

        <xsl:variable name="departments" select="//item[portfolio=$portfolio and type='organisation' and is_portfolio_department='1']"/>

        <xsl:if test="$departments">

            <h2>Departments</h2>

            <ul class="au-link-list">
                <xsl:for-each select="$departments">
                    <xsl:sort select="title"/>
                    <li>
                        <a href="/">
                            <xsl:value-of select="title"/>
                        </a>
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:if>

        <xsl:variable name="agencies" select="//item[portfolio=$portfolio and type='organisation' and not(is_portfolio_department='1')]"/>
        <xsl:if test="$agencies">

            <h2>Agencies</h2>

            <ul class="au-link-list">
                <xsl:for-each select="$agencies">
                    <xsl:sort select="title"/>
                    <li>
                        <a href="/">
                            <xsl:value-of select="title"/>
                        </a>
                    </li>
                </xsl:for-each>
            </ul>

        </xsl:if>

        <xsl:variable name="boards" select="//item[portfolio=$portfolio and type='board']"/>
        <xsl:if test="$boards">

            <h2>Government appointed boards</h2>

            <ul class="au-link-list">
                <xsl:for-each select="$boards">
                    <xsl:sort select="title"/>
                    <li>
                        <a href="/">
                            <xsl:value-of select="title"/>
                        </a>
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:if>



        <xsl:variable name="non_boards" select="//item[portfolio=$portfolio and type='non_board']"/>
        <xsl:if test="$non_boards">

            <h2>Other boards and structures</h2>

            <ul class="au-link-list">
                <xsl:for-each select="$non_boards">
                    <xsl:sort select="title"/>
                    <li>
                        <a href="/">
                            <xsl:value-of select="title"/>
                        </a>
                    </li>
                </xsl:for-each>
            </ul>

        </xsl:if>

    </xsl:template>

    <xsl:template name="non-board-html-content">
        <xsl:param name="title"/>
        <h1><xsl:value-of select="$title"/></h1>
    </xsl:template>

    <!-- END: HTML content templates -->

    <!-- BEGIN: Property templates -->

    <xsl:template match="content_id">
        <span itemprop=""><xsl:value-of select="."/></span>
    </xsl:template>

    <xsl:template match="unique_record_id">
        <span itemprop=""><xsl:value-of select="."/></span>
    </xsl:template>

    <xsl:template match="title">
        <h1 itemprop="name"><xsl:value-of select="."/></h1>
    </xsl:template>

    <xsl:template match="type">
    </xsl:template>

    <xsl:template match="portfolio">
        <xsl:param name="portfolio" />

        <span itemprop="parentOrganization"><xsl:value-of select="$portfolio"/></span>
    </xsl:template>


    <!-- BEGIN: Organisation fields -->
    <xsl:template match="abn">
        <span itemprop="taxID"><xsl:value-of select="."/></span>
    </xsl:template>

    <xsl:template match="annual_report_prep_tabled">
    </xsl:template>

    <xsl:template match="annual_reports">
    </xsl:template>

    <xsl:template match="auditor">
    </xsl:template>

    <xsl:template match="asl">
    </xsl:template>

    <xsl:template match="board_committee_appointed_by">
    </xsl:template>

    <xsl:template match="board_contact_email">
    </xsl:template>

    <xsl:template match="board_function_category">
    </xsl:template>

    <xsl:template match="budget_documentation">
    </xsl:template>

    <xsl:template match="classification">
    </xsl:template>

    <xsl:template match="creation_date">
        <span itemprop="foundingDate"><xsl:value-of select="."/></span>
    </xsl:template>

    <xsl:template match="current_budget_total_expenditure">
    </xsl:template>

    <xsl:template match="current_budget_total_appropriations">
    </xsl:template>

    <xsl:template match="description">
        <div itemprop="description"><xsl:value-of select="."/></div>
    </xsl:template>

    <xsl:template match="email">
    </xsl:template>

    <xsl:template match="established_by_under">
    </xsl:template>

    <xsl:template match="gfs_function">
    </xsl:template>

    <xsl:template match="gfs_sector_classification">
    </xsl:template>

    <xsl:template match="materiality">
    </xsl:template>

    <xsl:template match="max_members">
    </xsl:template>

    <xsl:template match="org_acroynm">
    </xsl:template>

    <xsl:template match="paid_members">
    </xsl:template>

    <xsl:template match="is_portfolio_department">
    </xsl:template>

    <xsl:template match="strat_corp_org_plan">
    </xsl:template>

    <xsl:template match="type_of_body">
    </xsl:template>

    <xsl:template match="updated">
    </xsl:template>

    <xsl:template match="website">
        <xsl:variable name="website" select="."/>
        <a itemprop="sameAs" href="{$website}"><xsl:value-of select="."/></a>
    </xsl:template>

    <xsl:template match="address">
    </xsl:template>

    <xsl:template match="postal_address">
    </xsl:template>

    <xsl:template match="ps_act_body">
    </xsl:template>
    <!-- END: Organisation fields -->


    <xsl:template name="html-page">
        <xsl:param name="type"/>
        <xsl:param name="title"/>
        <xsl:param name="uri"/>
        <xsl:param name="content_id"/>
        <xsl:param name="last_modified"/>

        <xsl:variable name="html-template-name" select="concat(type, '-html-content')"/>

        <xsl:document href="output/{$uri}" method="html" indent="yes">
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="DCTERMS.modified" content="2018-01-02T09:03:38+11:00" schema="DCTERMS.ISO8601" />
<meta name="DCTERMS.identifier" content="https://www.australia.gov.au/directories/australia/portfolio/agriculture" />
<link rel="shortcut icon" href="/profiles/gsecms/themes/ausgovau_bootstrap/favicons/favicon-16x16.png" type="image/png" />
<link rel="schema.AGLSTERMS" href="http://www.agls.gov.au/agls/terms/" />
<meta name="DCTERMS.created" content="2013-05-16T08:04:12+10:00" schema="DCTERMS.ISO8601" />
<meta name="MobileOptimized" content="width" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=2, user-scalable=0" />
<meta name="HandheldFriendly" content="true" />
<link rel="canonical" href="agriculture" />
<meta name="DCTERMS.creator" content="Digital Transformation Agency" />
<meta name="DCTERMS.publisher" content="Digital Transformation Agency" />
<meta name="DCTERMS.title" content="$title" />
<meta name="DCTERMS.description" content="australia.gov.au page for the $title portfolio provides details of its Ministers, Department and agencies and links to their websites, contact details and other resources." />
<meta name="GSETERMS.shortform" content="agriculture" />

<title><xsl:value-of select="$title"/> | australia.gov.au</title>

<link rel="apple-touch-icon" sizes="57x57" href="/profiles/gsecms/themes/ausgovau_bootstrap/favicons/apple-touch-icon-57x57.png"/>
<link rel="apple-touch-icon" sizes="60x60" href="/profiles/gsecms/themes/ausgovau_bootstrap/favicons/apple-touch-icon-60x60.png"/>
<link rel="apple-touch-icon" sizes="72x72" href="/profiles/gsecms/themes/ausgovau_bootstrap/favicons/apple-touch-icon-72x72.png"/>
<link rel="apple-touch-icon" sizes="76x76" href="/profiles/gsecms/themes/ausgovau_bootstrap/favicons/apple-touch-icon-76x76.png"/>
<link rel="apple-touch-icon" sizes="114x114" href="/profiles/gsecms/themes/ausgovau_bootstrap/favicons/apple-touch-icon-114x114.png"/>
<link rel="apple-touch-icon" sizes="120x120" href="/profiles/gsecms/themes/ausgovau_bootstrap/favicons/apple-touch-icon-120x120.png"/>
<link rel="apple-touch-icon" sizes="144x144" href="/profiles/gsecms/themes/ausgovau_bootstrap/favicons/apple-touch-icon-144x144.png"/>
<link rel="apple-touch-icon" sizes="152x152" href="/profiles/gsecms/themes/ausgovau_bootstrap/favicons/apple-touch-icon-152x152.png"/>
<link rel="apple-touch-icon" sizes="180x180" href="/profiles/gsecms/themes/ausgovau_bootstrap/favicons/apple-touch-icon-180x180.png"/>
<link rel="icon" type="image/png" href="/profiles/gsecms/themes/ausgovau_bootstrap/favicons/favicon-32x32.png" sizes="32x32"/>
<link rel="icon" type="image/png" href="/profiles/gsecms/themes/ausgovau_bootstrap/favicons/android-chrome-192x192.png" sizes="192x192"/>
<link rel="icon" type="image/png" href="/profiles/gsecms/themes/ausgovau_bootstrap/favicons/favicon-96x96.png" sizes="96x96"/>
<link rel="icon" type="image/png" href="/profiles/gsecms/themes/ausgovau_bootstrap/favicons/favicon-16x16.png" sizes="16x16"/>
<link rel="manifest" href="/profiles/gsecms/themes/ausgovau_bootstrap/favicons/manifest.json"/>
<meta name="msapplication-TileColor" content="#00022c"/>
<meta name="msapplication-TileImage" content="/profiles/gsecms/themes/ausgovau_bootstrap/favicons/mstile-144x144.png"/>
<meta name="theme-color" content="#00022C"/>
<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
<meta name="mobile-web-app-capable" content="yes"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>

<link href='https://fonts.googleapis.com/css?family=Open+Sans:400italic,400,600,300,700' rel='stylesheet' type='text/css'/>

<meta property="og:image" content="https://www.australia.gov.au/profiles/gsecms/themes/ausgovau_bootstrap/images/decoration-flag.jpg" />
<meta property="og:description" content="Entry point for all Australian Commonwealth Government authorised information and services." />
<meta property="og:title" content="Agriculture and Water Resources | australia.gov.au" />

<link type="text/css" rel="stylesheet" href="/sites/default/files/css/css_xE-rWrJf-fncB6ztZfd2huxqgxu4WO-qwma6Xer30m4.css" media="all" />
<link type="text/css" rel="stylesheet" href="/sites/default/files/css/css_zWfPetBrjxwjs6Iur4IGyOU5Li5P2UPXpPjft7fFsiw.css" media="all" />
<link type="text/css" rel="stylesheet" href="/sites/default/files/css/css_WcE5e35e3-d4rXtf-yF7dg3wb9HPhtCt7LPwk0I2qgc.css" media="all" />
<link type="text/css" rel="stylesheet" href="/sites/default/files/css/css_Rh19HyeYTSjVd2GOLAWfeTW90mJowRKmzEa82S8l1f8.css" media="all" />
<script type="text/javascript" src="/profiles/gsecms/themes/ausgovau_bootstrap/javascripts/vendor/jquery.min.js"></script>
<script type="text/javascript" src="/misc/jquery.once.js"></script>
<script type="text/javascript" src="/misc/drupal.js"></script>
<script type="text/javascript" src="/misc/jquery.cookie.js"></script>
<script type="text/javascript" src="/misc/jquery.form.js"></script>
<script type="text/javascript" src="/misc/ajax.js"></script>
<script type="text/javascript" src="/profiles/gsecms/modules/contrib/absolute_messages/absolute_messages.js"></script>
<script type="text/javascript">
jQuery.extend(Drupal.absolute_messages, {"dismiss":{"status":false,"warning":false,"error":false},"dismiss_time":{"status":"","warning":"","error":""},"dismiss_all_count":2});
</script>
<script type="text/javascript" src="/profiles/gsecms/modules/australia.gov.au/search/ausgov_search_ac/js/ausgov_search_autocomplete.js"></script>
<script type="text/javascript" src="/profiles/gsecms/modules/contrib/views/js/base.js"></script>
<script type="text/javascript" src="/misc/progress.js"></script>
<script type="text/javascript" src="/profiles/gsecms/modules/contrib/views/js/ajax_view.js"></script>
<script type="text/javascript">
var text_resize_scope = "contentWrapper";
          var text_resize_minimum = "12";
          var text_resize_maximum = "25";
          var text_resize_line_height_allow = false;
          var text_resize_line_height_min = 16;
          var text_resize_line_height_max = 36;
</script>
<script type="text/javascript" src="/profiles/gsecms/modules/custom/text_resize/text_resize.js"></script>
<script type="text/javascript" src="/profiles/gsecms/modules/contrib/google_analytics/googleanalytics.js"></script>
<script type="text/javascript">
(function(i,s,o,g,r,a,m){i["GoogleAnalyticsObject"]=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,"script","//www.google-analytics.com/analytics.js","ga");ga("create", "UA-40319091-1", {"cookieDomain":"auto"});ga("set", "anonymizeIp", true);ga("send", "pageview");
</script>
<script type="text/javascript" src="/profiles/gsecms/themes/ausgovau_bootstrap/javascripts/vendor/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="/profiles/gsecms/themes/ausgovau_bootstrap/javascripts/vendor/jquery-ui.min.js"></script>
<script type="text/javascript" src="/profiles/gsecms/themes/ausgovau_bootstrap/javascripts/vendor/cssua.min.js"></script>
<script type="text/javascript" src="/profiles/gsecms/themes/ausgovau_bootstrap/javascripts/main.js"></script>
<script type="text/javascript">
jQuery.extend(Drupal.settings, {"basePath":"\/","pathPrefix":"","ajaxPageState":{"theme":"ausgovau_bootstrap","theme_token":"oFF3CwkjvcW2OHyA24DSqdbd3Cb3hqQK1hRrBbP6DIc","js":{"misc\/jquery.js":1,"misc\/jquery.once.js":1,"misc\/drupal.js":1,"misc\/jquery.cookie.js":1,"misc\/jquery.form.js":1,"misc\/ajax.js":1,"profiles\/gsecms\/modules\/contrib\/absolute_messages\/absolute_messages.js":1,"0":1,"profiles\/gsecms\/modules\/australia.gov.au\/search\/ausgov_search_ac\/js\/ausgov_search_autocomplete.js":1,"profiles\/gsecms\/modules\/contrib\/views\/js\/base.js":1,"misc\/progress.js":1,"profiles\/gsecms\/modules\/contrib\/views\/js\/ajax_view.js":1,"1":1,"profiles\/gsecms\/modules\/custom\/text_resize\/text_resize.js":1,"profiles\/gsecms\/modules\/contrib\/google_analytics\/googleanalytics.js":1,"2":1,"profiles\/gsecms\/themes\/ausgovau_bootstrap\/javascripts\/vendor\/bootstrap\/bootstrap.min.js":1,"profiles\/gsecms\/themes\/ausgovau_bootstrap\/javascripts\/vendor\/jquery-ui.min.js":1,"profiles\/gsecms\/themes\/ausgovau_bootstrap\/javascripts\/vendor\/cssua.min.js":1,"profiles\/gsecms\/themes\/ausgovau_bootstrap\/javascripts\/main.js":1},"css":{"modules\/system\/system.base.css":1,"modules\/system\/system.menus.css":1,"modules\/system\/system.messages.css":1,"modules\/system\/system.theme.css":1,"modules\/comment\/comment.css":1,"profiles\/gsecms\/modules\/contrib\/date\/date_api\/date.css":1,"profiles\/gsecms\/modules\/contrib\/date\/date_popup\/themes\/datepicker.1.7.css":1,"modules\/field\/theme\/field.css":1,"modules\/node\/node.css":1,"modules\/search\/search.css":1,"modules\/user\/user.css":1,"profiles\/gsecms\/modules\/contrib\/views\/css\/views.css":1,"profiles\/gsecms\/modules\/contrib\/absolute_messages\/absolute_messages.css":1,"profiles\/gsecms\/modules\/contrib\/ctools\/css\/ctools.css":1,"profiles\/gsecms\/modules\/custom\/text_resize\/text_resize.css":1,"profiles\/gsecms\/themes\/ausgovau_bootstrap\/stylesheets\/styles.css":1,"profiles\/gsecms\/themes\/ausgovau_bootstrap\/stylesheets\/local.css":1,"profiles\/gsecms\/themes\/ausgovau_bootstrap\/stylesheets\/jquery-ui.css":1}},"better_exposed_filters":{"views":{"quick_start_tab_prev":{"displays":{"block":{"filters":[]},"block_1":{"filters":[]},"block_2":{"filters":[]},"block_4":{"filters":[]},"block_5":{"filters":[]},"block_3":{"filters":[]}}},"quick_start_tab_views":{"displays":{"block":{"filters":[]},"block_4":{"filters":[]},"block_1":{"filters":[]},"block_2":{"filters":[]},"block_5":{"filters":[]},"block_3":{"filters":[]}}},"government_initiatives":{"displays":{"block":{"filters":[]}}},"in_focus_view":{"displays":{"block":{"filters":[]}}},"organisation_contacts_view":{"displays":{"block":{"filters":[]}}},"related_snapshot_content":{"displays":{"block":{"filters":[]}}},"ic_portfolio_content_page":{"displays":{"block":{"filters":[]}}}}},"googleanalytics":{"trackOutbound":1,"trackMailto":1,"trackDownload":1,"trackDownloadExtensions":"7z|aac|arc|arj|asf|asx|avi|bin|csv|doc|exe|flv|gif|gz|gzip|hqx|jar|jpe?g|js|mp(2|3|4|e?g)|mov(ie)?|msi|msp|pdf|phps|png|ppt|qtm?|ra(m|r)?|sea|sit|tar|tgz|torrent|txt|wav|wma|wmv|wpd|xls|xml|z|zip"},"urlIsAjaxTrusted":{"\/directories\/australia\/portfolio\/agriculture":true}});
</script>
<script src="/profiles/gsecms/themes/ausgovau_bootstrap/javascripts/vendor/html5shiv.min.js"></script>
<script src="/profiles/gsecms/themes/ausgovau_bootstrap/javascripts/vendor/rem.min.js"></script>
<script src="/profiles/gsecms/themes/ausgovau_bootstrap/javascripts/vendor/modernizr-n-respond.min.js"></script>
<script src="/profiles/gsecms/themes/ausgovau_bootstrap/javascripts/govtest.js"></script>

<link href='https://fonts.googleapis.com/css?family=Open+Sans:400italic,400,600,300,700' rel='stylesheet' type='text/css'/>

<link href="https://www.australia.gov.au/sites/default/files/css/css_xE-rWrJf-fncB6ztZfd2huxqgxu4WO-qwma6Xer30m4.css" rel="stylesheet"/>
<link type="text/css" rel="stylesheet" href="https://www.australia.gov.au/sites/default/files/css/css_zWfPetBrjxwjs6Iur4IGyOU5Li5P2UPXpPjft7fFsiw.css" media="all" />
<link type="text/css" rel="stylesheet" href="https://www.australia.gov.au/sites/default/files/css/css_WcE5e35e3-d4rXtf-yF7dg3wb9HPhtCt7LPwk0I2qgc.css" media="all" />
<link type="text/css" rel="stylesheet" href="https://www.australia.gov.au/sites/default/files/css/css_Rh19HyeYTSjVd2GOLAWfeTW90mJowRKmzEa82S8l1f8.css" media="all" />

</head>



<body class="html not-front not-logged-in one-sidebar sidebar-first page-node page-node- page-node-4 node-type-portfolio">

<div id="skip-link">
    <a href="agriculture.html#nav-primary" tabindex="1" class="screen-reader-text">Jump to navigation</a>
    <a href="agriculture.html#main" tabindex="1" class="screen-reader-text">Skip to main content</a>
</div>

<div id="main-body">

<header id="header" role="banner" class="clearfix">
<div class="container">
<a id="crest" href="/" title="Home" rel="home">Australian Government</a>
<div id="site-title" title="Home">
<a href="/">Australia.gov.au</a>
</div>
<div id="topbar-search" role="search">

<form action="agriculture" method="post" id="siteSearchForm" accept-charset="UTF-8"><div><div class="container-inline">
<h2 class="element-invisible">Search form</h2>
<div class="form-item form-type-textfield form-item-search-block-form">
<label class="element-invisible" for="edit-search-block-form--2">Search </label>
<input title="Search" placeholder="Search" autocomplete="off" type="text" id="edit-search-block-form--2" name="search_block_form" value="" size="15" maxlength="128" class="form-text" />
</div>
<div class="form-actions form-wrapper" id="edit-actions"><input type="submit" id="edit-submit" name="op" value=" Search" class="form-submit" /></div><input type="hidden" name="form_build_id" value="form-krzAVOSvMSpF6aHhx_D_XHjN4fkc__xYRhZAT1h2DCc" />
<input type="hidden" name="form_id" value="search_block_form" />
</div>
</div>
</form>

</div>

<div id="nav-toggle">
<a href="javascript:null;" role="button">
<span class="sr-only">Toggle </span>
<span>Menu</span>
<i></i>
<i></i>
<i></i>
</a>
</div>
</div>
</header>

<!-- #main-navigation -->
<nav id="nav-primary" role="navigation">
<ul class="menu"><li class="first leaf"><i class="icon icon-home icon-tid-22"></i><a href="../../../index" id="nav-item-home">Home</a></li>
<li class="expanded"><i class="icon icon-information-and-services icon-tid-25"></i><a href="../../../information-and-services" id="nav-item-information-and-services">Information and Services</a><div class="sub-menu" id="nav-sub-menu-information-and-services"><div class="row"><div class="col-md-3 col-sm-3"><ul><li class="mobile-only"><a href="agriculture.html#" class="sub-menu-back">Close</a></li><li class="first collapsed"><i class="icon icon-benefits-and-payments icon-tid-67"></i><a href="../../../information-and-services/benefits-and-payments" id="nav-item-benefits-and-payments">Benefits and Payments</a></li>
<li class="collapsed"><i class="icon icon-environment icon-tid-74"></i><a href="../../../information-and-services/environment" id="nav-item-environment">Environment</a></li>
<li class="collapsed"><i class="icon icon-it-and-communications icon-tid-79"></i><a href="../../../information-and-services/it-and-communications" id="nav-item-it-and-communications">IT and Communications</a></li>
<li class="collapsed"><i class="icon icon-public-safety-and-law icon-tid-80"></i><a href="../../../information-and-services/public-safety-and-law" id="nav-item-public-safety-and-law">Public Safety and Law</a></li>
</ul></div><div class="col-md-3 col-sm-3"><ul><li class="collapsed"><i class="icon icon-business-and-industry icon-tid-68"></i><a href="../../../information-and-services/business-and-industry" id="nav-item-business-and-industry">Business and Industry</a></li>
<li class="collapsed"><i class="icon icon-family-and-community icon-tid-75"></i><a href="../../../information-and-services/family-and-community" id="nav-item-family-and-community">Family and Community</a></li>
<li class="collapsed"><i class="icon icon-jobs-and-workplace icon-tid-73"></i><a href="../../../information-and-services/jobs-and-workplace" id="nav-item-jobs-and-workplace">Jobs and Workplace</a></li>
<li class="collapsed"><i class="icon icon-security-and-defence icon-tid-70"></i><a href="../../../information-and-services/security-and-defence" id="nav-item-security-and-defence">Security and Defence</a></li>
</ul></div><div class="col-md-3 col-sm-3"><ul><li class="collapsed"><i class="icon icon-culture-and-arts icon-tid-69"></i><a href="../../../information-and-services/culture-and-arts" id="nav-item-culture-and-arts">Culture and Arts</a></li>
<li class="collapsed"><i class="icon icon-health icon-tid-77"></i><a href="../../../information-and-services/health" id="nav-item-health">Health</a></li>
<li class="collapsed"><i class="icon icon-money-and-tax icon-tid-71"></i><a href="../../../information-and-services/money-and-tax" id="nav-item-money-and-tax">Money and Tax</a></li>
<li class="collapsed"><i class="icon icon-transport-and-regional icon-tid-83"></i><a href="../../../information-and-services/transport-and-regional" id="nav-item-transport-and-regional">Transport and Regional</a></li>
</ul></div><div class="col-md-3 col-sm-3"><ul><li class="collapsed"><i class="icon icon-education-and-training icon-tid-72"></i><a href="../../../information-and-services/education-and-training" id="nav-item-education-and-training">Education and Training</a></li>
<li class="collapsed"><i class="icon icon-immigration-and-visas icon-tid-78"></i><a href="../../../information-and-services/immigration-and-visas" id="nav-item-immigration-and-visas">Immigration and Visas</a></li>
<li class="collapsed"><i class="icon icon-passports-and-travel icon-tid-381"></i><a href="../../../information-and-services/passports-and-travel" id="nav-item-passports-and-travel">Passports and Travel</a></li>
<li class="last leaf"><i class="icon icon-a-z-of-government-services icon-tid-39"></i><a href="../../../information-and-services/a-z-of-government-services" id="nav-item-a-z-of-government-services">A–Z of Government Services</a></li>
</ul></div></div></div></li>
<li class="expanded"><i class="icon icon-about-government icon-tid-28"></i><a href="../../../about-government" id="nav-item-about-government">About Government</a><div class="sub-menu" id="nav-sub-menu-about-government"><div class="row"><div class="col-md-3 col-sm-3"><ul><li class="mobile-only"><a href="agriculture.html#" class="sub-menu-back">Close</a></li><li class="first collapsed"><i class="icon icon-contact-government icon-tid-102"></i><a href="../../../about-government/contact-government" id="nav-item-contact-government">Contact Government</a></li>
<li class="collapsed"><i class="icon icon-publications icon-tid-29"></i><a href="../../../about-government/publications" id="nav-item-publications">Publications</a></li>
</ul></div><div class="col-md-3 col-sm-3"><ul><li class="collapsed"><i class="icon icon-departments-and-agencies icon-tid-104"></i><a href="../../../about-government/departments-and-agencies" id="nav-item-departments-and-agencies">Departments and Agencies</a></li>
<li class="leaf"><i class="icon icon-cross-government-bodies icon-tid-4001"></i><a href="../../../about-government/cross-government-bodies" id="nav-item-cross-government-bodies">Cross Government Bodies</a></li>
</ul></div><div class="col-md-3 col-sm-3"><ul><li class="collapsed"><i class="icon icon-government-and-parliament icon-tid-76"></i><a href="../../../about-government/government-and-parliament" id="nav-item-government-and-parliament">Government and Parliament</a></li>
<li class="collapsed"><i class="icon icon-states-territories-and-local-government icon-tid-439"></i><a href="../../../about-government/states-territories-and-local-government" id="nav-item-states-territories-and-local-government">States, Territories and Local Government</a></li>
</ul></div><div class="col-md-3 col-sm-3"><ul><li class="collapsed"><i class="icon icon-international-relations icon-tid-228"></i><a href="../../../about-government/international-relations" id="nav-item-international-relations">International Relations</a></li>
<li class="last collapsed"><i class="icon icon-how-government-works icon-tid-99"></i><a href="../../../about-government/how-government-works" id="nav-item-how-government-works">How Government Works</a></li>
</ul></div></div></div></li>
<li class="expanded"><i class="icon icon-news-and-social-media icon-tid-30"></i><a href="../../../news-and-social-media" id="nav-item-news-and-social-media">News and Social Media</a><div class="sub-menu" id="nav-sub-menu-news-and-social-media"><div class="row"><div class="col-md-3 col-sm-3"><ul><li class="mobile-only"><a href="agriculture.html#" class="sub-menu-back">Close</a></li><li class="first collapsed"><i class="icon icon-media-releases icon-tid-114"></i><a href="../../../news-and-social-media/media-releases" id="nav-item-media-releases">Media Releases</a></li>
<li class="leaf"><i class="icon icon-what-s-on icon-tid-115"></i><a href="../../../news-and-social-media/whats-on" id="nav-item-what-s-on">What's On</a></li>
</ul></div><div class="col-md-3 col-sm-3"><ul><li class="collapsed"><i class="icon icon-social-media icon-tid-113"></i><a href="../../../news-and-social-media/social-media" id="nav-item-social-media">Social Media</a></li>
<li class="last leaf"><i class="icon icon-public-consultations icon-tid-112"></i><a href="../../../news-and-social-media/public-consultations" id="nav-item-public-consultations">Public consultations</a></li>
</ul></div><div class="col-md-3 col-sm-3"><ul><li class="leaf"><i class="icon icon-apps icon-tid-447"></i><a href="../../../news-and-social-media/apps" id="nav-item-apps">Apps</a></li>
</ul></div><div class="col-md-3 col-sm-3"><ul><li class="leaf"><i class="icon icon-campaigns icon-tid-116"></i><a href="../../../news-and-social-media/campaigns" id="nav-item-campaigns">Campaigns</a></li>
</ul></div></div></div></li>
<li class="expanded"><i class="icon icon-about-australia icon-tid-27"></i><a href="../../../about-australia" id="nav-item-about-australia">About Australia</a><div class="sub-menu" id="nav-sub-menu-about-australia"><div class="row"><div class="col-md-3 col-sm-3"><ul><li class="mobile-only"><a href="agriculture.html#" class="sub-menu-back">Close</a></li><li class="first collapsed"><i class="icon icon-facts-and-figures icon-tid-66"></i><a href="../../../about-australia/facts-and-figures" id="nav-item-facts-and-figures">Facts and Figures</a></li>
</ul></div><div class="col-md-3 col-sm-3"><ul><li class="collapsed"><i class="icon icon-special-dates-and-events icon-tid-174"></i><a href="../../../about-australia/special-dates-and-events" id="nav-item-special-dates-and-events">Special dates and events</a></li>
</ul></div><div class="col-md-3 col-sm-3"><ul><li class="last collapsed"><i class="icon icon-our-country icon-tid-98"></i><a href="../../../about-australia/our-country" id="nav-item-our-country">Our country</a></li>
</ul></div></div></div></li>
<li class="last leaf"><i class="icon icon-mygov icon-tid-3746"></i><a href="https://www.australia.gov.au/mygov" id="nav-item-mygov">myGov</a></li>
</ul>  </nav>


            <main>
            <div id="page">
            <div id="main-content">
            <div class="container">
            <div class="row">

<div id="breadcrumb" class="clearfix">
              <!-- #breadcrumb-inside -->
              <div id="breadcrumb-inside" class="clearfix">
                <ol class="breadcrumb"><li><a href="/">Home</a></li><li><a href="/about-government">About Government</a></li><li><a href="/about-government/departments-and-agencies">Departments and Agencies</a></li><li><a href="/about-government/departments-and-agencies/government-by-portfolio">Government by Portfolio</a></li><li>Agriculture and Water Resources</li></ol>              </div>
              <!-- EOF: #breadcrumb-inside -->
            </div>

            <aside class="col-md-4"></aside>
            <section class="col-md-8">

            <xsl:call-template name="portfolio-html-content">
                <xsl:with-param name="title" select="$title"/>
                <xsl:with-param name="type" select="$type"/>
                <xsl:with-param name="portfolio" select="$content_id"/>
            </xsl:call-template>

            </section>
            </div>
            </div>
            </div>
            </div>
            </main>

<footer id="footer" class="clearfix">
  <div class="container">
    <!-- #subfooter-inside -->
    <div id="footer-inside" class="clearfix">
      <div class="row">
        <div class="col-md-12">
                      <h2 class="sr-only">Footer links</h2>
              <div class="region region-footer">
          <div id="block-menu-menu-corporate-footer" class="block block-menu clearfix">
                    <h2 class="sr-only">Site footer</h2>
            
      <div class="content">
        <ul class="menu"><li class="first leaf"><a href="/about" title="">About</a></li>
<li class="leaf"><a href="/accessibility" title="">Accessibility</a></li>
<li class="leaf"><a href="/copyright" title="Copyright">Copyright</a></li>
<li class="leaf"><a href="/help-and-contact" title="">Help</a></li>
<li class="leaf"><a href="/site-map" title="">Site map</a></li>
<li class="last leaf"><a href="/terms-of-use" title="">Terms of use</a></li>
</ul>      </div>
    </div>
    </div>
                  </div>
      </div>
    </div>
  </div>
</footer>

            </div>
        </body>
        </html>
        </xsl:document>
    </xsl:template>
    
</xsl:stylesheet>

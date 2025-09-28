$.ajax({
    url: "https://rumahjurnal.uinbukittinggi.ac.id/api/v1/data/banner", // Replace with your API endpoint
    method: "GET",
    dataType: "json",
    success: function (data) {

        console.log("Data fetched successfully:", data);
        data.data.map(function (item) {

            // Example: Append banner items to the #banner element
            $('#banner').append(`
                            <div class="ltn__slide-item ltn__slide-item-2 ltn__slide-item-3-normal ltn__slide-item-3 bg-image"
                                data-bg="${item.image}"  style="max-height: 550px;">
                                <div class="ltn__slide-item-inner">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-lg-12 align-self-center">
                                                <div class="slide-item-info">
                                                    <div class="slide-item-info-inner ltn__slide-animation">
                                                        
                                                       
                                                        <h1 class="slide-title animated ">
                                                            ${item.title}
                                                        </h1>
                                                        <div class="slide-brief animated">
                                                            <p>
                                                                ${item.subtitle}
                                                                </p>
                                                        </div>
                                                        <div class="btn-wrapper animated">
                                                            <a href="${item.url}" class="theme-btn-1 btn btn-effect-1">
                                                                More
                                                            </a>
                                                        
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="slide-item-img">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        `);
        });

        var $backgroundImage = $('.bg-image, .bg-image-top');
        $backgroundImage.each(function () {
            var $this = $(this),
                $bgImage = $this.data('bg');
            $this.css('background-image', 'url(' + $bgImage + ')');
        });


        $('.ltn__slide-one-active').slick({
            autoplay: false,
            autoplaySpeed: 2000,
            arrows: true,
            dots: false,
            fade: true,
            cssEase: 'linear',
            infinite: true,
            speed: 300,
            slidesToShow: 1,
            slidesToScroll: 1,
            prevArrow: '<a class="slick-prev"><i class="fas fa-arrow-left" alt="Arrow Icon"></i></a>',
            nextArrow: '<a class="slick-next"><i class="fas fa-arrow-right" alt="Arrow Icon"></i></a>',
            responsive: [
                {
                    breakpoint: 1200,
                    settings: {
                        arrows: false,
                        dots: true,
                    }
                }
            ]
        }).on('afterChange', function () {
            new WOW().init();
        });


    },
    error: function (xhr, status, error) {
        console.error("Error fetching data:", error);
    }
});

$.ajax({
    url: `https://rumahjurnal.uinbukittinggi.ac.id/api/v1/data/journal`,
    method: "GET",
    dataType: "json",
    success: function (data) {

        console.log("Journal data fetched successfully:", data);
        // Process and display the journal data as needed
        data.data.map(function (item) {
            $('#editor_chief_' + item.url_path).html(item.editor_chief_name)
            $('#fee_' + item.url_path).html(new Intl.NumberFormat('id-ID', { style: 'currency', currency: 'IDR' }).format(item.author_fee))
            item.indexing.map(function (itemx) {
                console.log(itemx.label);
                $('#filter_' + item.url_path).addClass(itemx.label)
                $('#icon_' + item.url_path).append(`<img src="${itemx.icon}" alt="${itemx.label}" style="height: 30px;">`)
                $('#indexing_' + item.url_path).append(`<img src="${itemx.icon}" alt="${itemx.label}" style="height: 40px;">`)
            })
        });
    },
    error: function (xhr, status, error) {
        console.error("Error fetching journal data:", error);
    }
});
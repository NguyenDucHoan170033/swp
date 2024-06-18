<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>360 View</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/flick/jquery-ui.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha384-tsQFqpEReu7ZLhBV2VZlAu7zcOV+rXbYlF2cqB8txI/8aZajjp4Bqd+V6D5IgvKT"
            crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="js/jquery.rotate360.js"></script> <!-- ???ng d?n ??n file JS riêng -->

    <style>
        .gallery-wrap .img-big-wrap img {
            height: 450px;
            width: auto;
            display: inline-block;
            cursor: zoom-in;
            margin-top: 10px;
        }
        .gallery-wrap .img-small-wrap .item-gallery {
            width: 60px;
            height: 60px;
            border: 1px solid #ddd;
            margin: 7px 2px;
            display: inline-block;
            overflow: hidden;
        }
        .gallery-wrap .img-small-wrap {
            text-align: center;
        }
        .gallery-wrap .img-small-wrap img {
            max-width: 100%;
            max-height: 100%;
            object-fit: cover;
            border-radius: 4px;
            cursor: zoom-in;
        }
        .img-big-wrap img {
            width: 100% !important;
            height: auto !important;
        }
        #slider {
            margin-top: 20px;
        }
        .btn-group-custom {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }
        .btn-group-custom .btn {
            flex: 1;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="container">
                    <div class="card">
                        <div class="row">
                            <aside class="col-sm-5 border-right">
                                <article class="gallery-wrap">
                                    <div class="img-big-wrap">
                                        <div><a href="#"><img src="${detail.image}" alt="Product Image"></a></div>
                                    </div>
                                    <div class="img-small-wrap"></div>
                                </article>
                            </aside>
                            <aside class="col-sm-7">
                                <article class="card-body p-5">
                                    <h3 class="title mb-3">${detail.name}</h3>
                                    <p class="price-detail-wrap">
                                        <span class="price h3 text-danger">
                                            <span class="currency">$</span><span class="num">${detail.price}</span>
                                        </span>
                                    </p>
                                    <dl class="item-property">
                                        <dt>Description</dt>
                                        <dd><p>${detail.description}</p></dd>
                                    </dl>
                                    <div class="btn-group-custom">
                                        <a href="addandcart?productId=${detail.id}" class="btn btn-lg btn-primary text-uppercase">Buy now</a>
                                        <a href="addcart?productId=${detail.id}" class="btn btn-lg btn-outline-primary text-uppercase"><i class="fas fa-shopping-cart"></i> Add to cart</a>
                                        <button type="button" class="btn btn-lg btn-info text-uppercase" data-toggle="modal" data-target="#view360Modal">View 360</button>
                                    </div>
                                    <div class="btn-group-custom">
                                        <a href="homecontroll" class="btn btn-lg btn-secondary text-uppercase">Back to Home</a>
                                    </div>
                                </article>
                            </aside>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal 360 View -->
    <div class="modal fade" id="view360Modal" tabindex="-1" role="dialog" aria-labelledby="view360ModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="view360ModalLabel">360 View</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="360-view" style="width: 100%; height: 600px; background-size: contain; background-repeat: no-repeat; background-position: center;"></div>
                    <div id="slider" style="margin-top: 20px;"></div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

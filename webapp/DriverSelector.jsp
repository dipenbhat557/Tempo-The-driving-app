<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Selector Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css"
        integrity="sha384-b6lVK+yci+bfDmaY1u0zE8YYJt0TZxLEAFyYSLHId4xoVvsrQu3INevFKo+Xir8e" crossorigin="anonymous">
    <!--Link for bootstrap icon-->
    <style>
        body {
            background-image: url("https://www.google.com/maps/d/thumbnail?mid=1sGvcKzz4h2-P2RqJUM3Ri7fPzCk&hl=en");
            width: 100%;
        }

        .arrow {
            width: 3%;
            color: white;
        }

        .arrow:hover {
            background-color: white;
            color: black;

        }

        #home {
            color: white;
            font-family: sans-serif;
        }

        #home:hover {
            font-size: 18px;
            background-color: white;
            color: rgb(12, 12, 12) !important;
        }

        nav {
            background-color: black;
        }

        #logo {
            font-family: sans-serif;
            font-size: 1.563rem;
            color: white;
            font-weight: 900;
        }

        #burger {
            background-color: white !important;
        }

        .form {
            opacity: 0.9;
        }

        .form:hover {
            opacity: 1 !important;
        }

        .rider {
            margin-top: 5%;
            background-color: #D9D9D9;
            border-radius: 5%;
        }

        .rider2 {
            margin-top: 5%;
            background-color: #D9D9D9;
            border-radius: 3%;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="nav-link arrow" href="#"><i class="bi bi-arrow-left mx-1"></i></a>
            <a class="navbar-brand" style="width: 35%; margin-left: 2%;" id="logo">
                TEMPO
            </a>
            <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarScroll">
                <span class="navbar-toggler-icon" id="burger"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarScroll">
                <ul class="navbar-nav me-auto my-2 my-lg-0">
                    <li class="nav-item">
                        <a class="nav-link me-2" id="home" href="#">Ride Conformation</a>
                    </li>
                </ul>
                <div class="dropdown">
                    <button type="button" class="btn btn-dark dropdown-toggle me-5" data-bs-toggle="dropdown">
                        HELP
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Contact Us</a></li>
                        <li><a class="dropdown-item" href="#">Chat With Us</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>


    <div class="container">
        <div class="row">
            <div class="col-4">

            </div>
            <div class="col-4 f1">
                <Section class="form">
                    <div class="card"
                        style="width: 18rem; margin-top: 9%; margin-left: 5%; padding-bottom: 5%; padding-top: 4%;">
                        <div class="card-body">
                            <input class="form-control mt-3 text-center" type="text" placeholder="Current location"
                                aria-label="default input example">
                            <input class="form-control mt-3 text-center" type="text" placeholder="Destined Location"
                                aria-label="default input example">
                            <div class="container rider">
                                <div class="row">
                                    <div class="col-3">
                                        <img src="https://randomuser.me/api/portraits/women/55.jpg" alt="Logo"
                                            style="width:44px" class="rounded-circle mt-2">
                                    </div>
                                    <div class="col-6 mt-2">
                                        <a class="nav-link" href="#">Ride name</a>
                                        <a class="nav-link" href="#">Ride Type</a>
                                        <a class="nav-link" href="#">Rider Number Plate</a>
                                    </div>
                                    <div class="col-3">
                                        <a class="nav-link" href="#">Price</a>
                                        <a class="nav-link" href="#">$$$$</a>
                                    </div>
                                </div>
                            </div>
                            <div class="container rider2">
                                <div class="row">
                                    <div class="col-3">
                                        <img src="https://randomuser.me/api/portraits/women/56.jpg" alt="Logo"
                                            style="width:44px" class="rounded-circle mt-2">
                                    </div>
                                    <div class="col-6 mt-2">
                                        <a class="nav-link" href="#">Ride name</a>
                                        <a class="nav-link" href="#">Ride Type</a>
                                        <a class="nav-link" href="#">Rider Number Plate</a>
                                    </div>
                                    <div class="col-3">
                                        <a class="nav-link" href="#">Price</a>
                                        <a class="nav-link" href="#">$$$$</a>
                                    </div>
                                </div>
                            </div>
                            <button type="button" class="btn btn-secondary mt-3"
                                style="margin-left: 70%;">Accept</button>
                        </div>
                    </div>
                </Section>
            </div>
            <div class="col-4">

            </div>
        </div>
    </div>


</body>
</html>
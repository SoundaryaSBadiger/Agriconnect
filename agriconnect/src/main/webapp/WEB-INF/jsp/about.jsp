
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | AgriConnect</title>
    <link rel="stylesheet" href="/css/style.css">

    <style>
        .about-hero {
            background: linear-gradient(rgba(20, 45, 25, 0.72),
                        rgba(20, 45, 25, 0.72)),
                        url('https://images.unsplash.com/photo-1500382017468-9049fed747ef?auto=format&fit=crop&w=1600&q=85');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 100px 25px;
            text-align: center;
        }

        .about-hero h1 {
            font-size: 44px;
            margin-bottom: 15px;
        }

        .about-hero p {
            max-width: 700px;
            margin: auto;
            font-size: 18px;
            line-height: 1.7;
        }

        .about-content {
            max-width: 1100px;
            margin: 60px auto;
            padding: 0 25px;
        }

        .about-section {
            margin-bottom: 50px;
        }

        .about-section h2 {
            color: #285b35;
            font-size: 28px;
            margin-bottom: 15px;
        }

        .about-section p {
            color: #555;
            font-size: 16px;
            line-height: 1.9;
        }

        .about-features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 22px;
            margin-top: 25px;
        }

        .feature-card {
            background: #fff;
            padding: 25px;
            border-radius: 12px;
            border: 1px solid #e5e9e3;
            box-shadow: 0 5px 18px rgba(0,0,0,0.05);
        }

        .feature-card h3 {
            color: #285b35;
            margin-bottom: 12px;
        }

        .feature-card p {
            font-size: 14px;
        }

        .about-cta {
            background: #285b35;
            color: white;
            text-align: center;
            padding: 45px 20px;
            border-radius: 14px;
            margin-bottom: 50px;
        }

        .about-cta h2 {
            margin-bottom: 12px;
        }

        .about-cta p {
            line-height: 1.7;
        }

        @media(max-width: 600px) {
            .about-hero h1 {
                font-size: 32px;
            }
        }
    </style>
</head>

<body>

<%@ include file="partials/nav.jsp" %>

<section class="about-hero">
    <h1>Connecting Agriculture to Opportunity</h1>
    <p>
        Building stronger connections between farmers, vendors and buyers
        through a simple and accessible digital marketplace.
    </p>
</section>

<main class="about-content">

    <section class="about-section">
        <h2>Who We Are</h2>
        <p>
            AgriConnect is an online agricultural marketplace designed
            to bring farmers, vendors and buyers together on one platform.
            We aim to make it easier for farmers to showcase their produce,
            for vendors to discover available products, and for buyers
            to find agricultural goods in one convenient place.
        </p>
    </section>

    <section class="about-section">
        <h2>Our Mission</h2>
        <p>
            Our mission is to simplify agricultural trading by providing
            a digital platform where users can discover products, manage
            listings and place orders. We want to support better
            communication and improve access to agricultural products.
        </p>
    </section>

    <section class="about-section">
        <h2>What We Offer</h2>

        <div class="about-features">

            <div class="feature-card">
                <h3>For Farmers</h3>
                <p>
                    Create product listings, manage available stock
                    and receive orders from interested buyers.
                </p>
            </div>

            <div class="feature-card">
                <h3>For Vendors</h3>
                <p>
                    Explore agricultural products and discover
                    potential sourcing opportunities.
                </p>
            </div>

            <div class="feature-card">
                <h3>For Buyers</h3>
                <p>
                    Browse available products, view product details
                    and place orders through the platform.
                </p>
            </div>

        </div>
    </section>

    <section class="about-section">
        <h2>Our Vision</h2>
        <p>
            We envision an agricultural ecosystem where technology
            helps connect people, makes product discovery easier
            and creates more accessible opportunities for
            agricultural businesses.
        </p>
    </section>

    <section class="about-cta">
        <h2>Be Part of AgriConnect</h2>
        <p>
            Join our growing marketplace and explore a simpler way
            to connect with the agricultural community.
        </p>
    </section>

</main>

<%@ include file="partials/footer.jsp" %>

</body>
</html>


<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | AgriConnect</title>
    <link rel="stylesheet" href="/css/style.css">

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            background: #f5f7f3;
            font-family: Arial, sans-serif;
            color: #26352a;
        }

        .dashboard {
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 25px;
        }

        .welcome {
            background: linear-gradient(120deg, #174d2c, #39794a);
            color: white;
            padding: 38px;
            border-radius: 16px;
            margin-bottom: 30px;
        }

        .welcome h1 {
            font-size: 30px;
            margin: 0 0 10px;
        }

        .welcome p {
            color: #e0eee2;
            margin: 5px 0;
        }

        .role {
            display: inline-block;
            background: rgba(255,255,255,.16);
            padding: 7px 14px;
            border-radius: 20px;
            margin-top: 12px;
            font-size: 12px;
            letter-spacing: 1px;
        }

        .section {
            background: white;
            padding: 26px;
            border-radius: 14px;
            margin-bottom: 25px;
            border: 1px solid #e8ede7;
            box-shadow: 0 4px 16px rgba(0,0,0,.035);
        }

        .section-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 22px;
        }

        .section-heading h2 {
            margin: 0;
            font-size: 21px;
            color: #244c30;
        }

        .btn {
            display: inline-block;
            background: #347746;
            color: white;
            padding: 11px 19px;
            border-radius: 7px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
        }

        .btn:hover {
            background: #245c34;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(230px, 1fr));
            gap: 20px;
        }

        .product-card {
            border: 1px solid #e8ece7;
            border-radius: 12px;
            padding: 21px;
            transition: .2s;
        }

        .product-card:hover {
            box-shadow: 0 7px 20px rgba(0,0,0,.07);
            transform: translateY(-3px);
        }

        .product-card h3 {
            margin: 0 0 12px;
            color: #285c36;
            font-size: 19px;
        }

        .product-card p {
            color: #68746b;
            font-size: 14px;
            line-height: 1.7;
        }

        .actions {
            display: flex;
            gap: 15px;
            margin-top: 17px;
            align-items: center;
        }

        .edit-link {
            color: #347746;
            text-decoration: none;
            font-weight: 600;
            font-size: 14px;
        }

        .delete-btn {
            background: none;
            border: none;
            color: #c34242;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
        }

        .table-wrap {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 700px;
        }

        th {
            background: #f0f5ef;
            color: #355b3d;
            padding: 15px;
            text-align: left;
            font-size: 13px;
        }

        td {
            padding: 15px;
            border-bottom: 1px solid #edf0ec;
            font-size: 14px;
            color: #505d53;
        }

        .status {
            display: inline-block;
            background: #e9f4e9;
            color: #347746;
            padding: 6px 11px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        select {
            padding: 8px;
            border: 1px solid #dce3da;
            border-radius: 6px;
            background: white;
        }

        .small-btn {
            padding: 8px 11px;
            background: #347746;
            border: none;
            color: white;
            border-radius: 6px;
            cursor: pointer;
            margin-left: 5px;
        }

        .message {
            background: #e8f5e9;
            color: #276338;
            padding: 13px 18px;
            border-radius: 8px;
            margin-bottom: 22px;
        }

        .empty {
            text-align: center;
            padding: 35px 15px;
            color: #78837a;
        }

        .empty h3 {
            color: #385941;
        }

        .vendor-info {
            background: #edf5ed;
            padding: 28px;
            border-radius: 12px;
            line-height: 1.8;
        }

        @media(max-width: 600px) {
            .dashboard {
                padding: 0 14px;
                margin: 22px auto;
            }

            .welcome {
                padding: 26px 20px;
            }

            .welcome h1 {
                font-size: 24px;
            }

            .section {
                padding: 19px;
            }
        }
    </style>
</head>

<body>

<%@ include file="partials/nav.jsp" %>

<main class="dashboard">

    <!-- Welcome Section -->
    <section class="welcome">
        <h1>Welcome back, ${user.fullName}</h1>
        <p>Manage your agricultural marketplace activities from one place.</p>
        <p>${user.location}</p>
        <span class="role">${user.role}</span>
    </section>

    <!-- Success Message -->
    <c:if test="${not empty success}">
        <div class="message">${success}</div>
    </c:if>

    <c:if test="${not empty error}">
        <div class="message">${error}</div>
    </c:if>

    <!-- FARMER DASHBOARD -->
    <c:if test="${user.role == 'FARMER'}">

        <section class="section">
            <div class="section-heading">
                <h2>Your Product Listings</h2>
                <a class="btn" href="/products/new">Add New Produce</a>
            </div>

            <div class="cards">

                <c:forEach items="${myProducts}" var="p">

                    <article class="product-card">
                        <h3>${p.name}</h3>

                        <p>
                            Price: ₹${p.price} / ${p.unit}<br>
                            Available stock: ${p.quantity}
                        </p>

                        <div class="actions">
                            <a class="edit-link"
                               href="/products/${p.id}/edit">Edit Listing</a>

                            <form method="post"
                                  action="/products/${p.id}/delete"
                                  onsubmit="return confirm('Delete this product listing?');">

                                <button class="delete-btn" type="submit">
                                    Delete
                                </button>
                            </form>
                        </div>
                    </article>

                </c:forEach>

            </div>

            <c:if test="${empty myProducts}">
                <div class="empty">
                    <h3>No products listed yet</h3>
                    <p>Start by adding your first agricultural product.</p>
                    <a href="/products/new" class="btn">Add Your First Product</a>
                </div>
            </c:if>
        </section>

        <!-- Farmer Orders -->
        <section class="section">
            <div class="section-heading">
                <h2>Incoming Orders</h2>
            </div>

            <div class="table-wrap">
                <table>
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Product</th>
                            <th>Buyer</th>
                            <th>Quantity</th>
                            <th>Total Amount</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${myOrders}" var="o">
                            <tr>
                                <td>#${o.id}</td>
                                <td>${o.product.name}</td>
                                <td>${o.buyer.fullName}</td>
                                <td>${o.quantity}</td>
                                <td>₹${o.totalPrice}</td>
                                <td><span class="status">${o.status}</span></td>

                                <td>
                                    <form method="post"
                                          action="/orders/${o.id}/status">

                                        <select name="status">
                                            <option value="CONFIRMED">Confirmed</option>
                                            <option value="COMPLETED">Completed</option>
                                            <option value="CANCELLED">Cancelled</option>
                                        </select>

                                        <button class="small-btn" type="submit">
                                            Update
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <c:if test="${empty myOrders}">
                <div class="empty">
                    <p>You haven't received any orders yet.</p>
                </div>
            </c:if>
        </section>

    </c:if>

    <!-- BUYER DASHBOARD -->
    <c:if test="${user.role == 'BUYER'}">

        <section class="section">
            <div class="section-heading">
                <h2>Your Orders</h2>
                <a href="/products" class="btn">Explore Marketplace</a>
            </div>

            <div class="table-wrap">
                <table>
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Product</th>
                            <th>Farmer</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Status</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${myOrders}" var="o">
                            <tr>
                                <td>#${o.id}</td>
                                <td>${o.product.name}</td>
                                <td>${o.product.farmer.fullName}</td>
                                <td>${o.quantity}</td>
                                <td>₹${o.totalPrice}</td>
                                <td>
                                    <span class="status">${o.status}</span>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <c:if test="${empty myOrders}">
                <div class="empty">
                    <h3>No orders found</h3>
                    <p>Discover fresh agricultural products from farmers.</p>
                    <a href="/products" class="btn">Browse Products</a>
                </div>
            </c:if>
        </section>

    </c:if>

    <!-- VENDOR DASHBOARD -->
    <c:if test="${user.role == 'VENDOR'}">

        <section class="section">
            <div class="section-heading">
                <h2>Vendor Marketplace</h2>
            </div>

            <div class="vendor-info">
                <h3>Discover Agricultural Products</h3>

                <p>
                    Explore products available from farmers, compare
                    listings and discover potential sourcing opportunities
                    for your business.
                </p>

                <a href="/products" class="btn">Browse Marketplace</a>
            </div>
        </section>

    </c:if>

</main>

<%@ include file="partials/footer.jsp" %>

</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chat World</title>
    <style>
        body {
            background: linear-gradient(to right, white);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        
        .form-container {
            width: 400px;
            padding: 20px;
            border: 2px solid blue;
            border-radius: 10px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            color: #333;
        }

        input[type="text"] {
            width: 100%;
            padding: 5px;
            font-size: 16px;
            margin-bottom: 20px;
            border: 2px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"], input[type="reset"] {
            width: 48%;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"] {
            background-color: green;
            color: white;
        }

        input[type="submit"]:hover {
            background-color: green;
        }

        input[type="reset"] {
            background-color: red;
            color: white;
        }

        input[type="reset"]:hover {
            background-color: #e04e37;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>

    <div class="form-container">
        <h1>Chat World</h1>
        <form action="frame.jsp">
            <label for="username">Enter Your UserName</label><br>
            <input type="text" name="username" ><br>

            <div class="button-container">
                <input type="submit" value="Submit">
                <input type="reset" value="Reset">
            </div>
        </form>
    </div>

</body>
</html>

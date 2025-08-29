<html>
<body>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@3.3.3/dist/tailwind.min.css" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        body
         {
            background:URL('https://img.freepik.com/free-photo/night-football-game_23-2151952487.jpg');
            color: #333;
            padding: 20px;
            min-height: 100vh;
        }
        .container
         {
            max-width: 120px;
            margin: 0 auto;
            background-color: transparent;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }
        header
         {
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid #0d3b66;
        }
        h1 
        {
            color: #0d3b66;
            font-size: 2.5rem;
            margin-bottom: 10px;
        }
        .subtitle 
        {
            color: #020b13;
            font-size: 1.2rem;
        }
        .table-container 
        {
            overflow-x: auto;
            margin: 10px 0;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: transparent;
        }
        th, td 
        {
            padding: 10px;
            text-align: center;
            border-bottom: transparent;
        }
        th 
        {
            background-color: transparent;
            color: rgb(238, 227, 227);
            font-weight: 50;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        tr:nth-child(even) 
        {
            background-color: transparent;
            color: rgb(238, 227, 227);
        }
        tr:nth-child(odd) 
        {
            background-color: transparent;
            color: rgb(238, 227, 227);
        }
        tr:hover 
        {
            background-color: #010608;
            transition: background-color 0.3s;
        }
        .pagination-container 
        {
            display: flex;
            justify-content: center;
            margin-top: 40px;
        }
        .pagination 
        {
            display: flex;
            list-style: none;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        .pagination li
        {
            margin: 0;
        }
        .pagination a, .pagination span
         {
           padding: 12px 20px;
    text-decoration: none;
    color: #fff;
    background: linear-gradient(145deg, #1e40af, #3b82f6);
    border: none;
    border-radius: 12px;
    display: block;
    transition: all 0.4s ease;
    box-shadow: 0 6px 0 #1e3a8a, 0 6px 15px rgba(0, 0, 0, 0.2);
    perspective: 1000px;
        }

        .pagination a:hover {
            transform: rotateY(15deg) translateY(-4px);
    box-shadow: 0 12px 0 #1e3a8a, 0 12px 20px rgba(0, 0, 0, 0.3);
    background: linear-gradient(145deg, #2563eb, #60a5fa);
        }

        .pagination .current-page {
              background: linear-gradient(145deg, #1d4ed8, #3b82f6);
    color: white;
    font-weight: bold;
    box-shadow: 0 6px 0 #1e3a8a, 0 6px 20px rgba(0, 0, 0, 0.3);
        }    

        .pagination a:first-child {
            border-top-left-radius: 20px;
            border-bottom-left-radius: 20px;
        }
        .pagination a:last-child {
            border-top-right-radius: 20px;
            border-bottom-right-radius: 20px;
        }
        footer {
            text-align: center;
            margin-top: 30px;
            color: white;
            font-size: 0.9rem;
        }
        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }
            th, td {
                padding: 15px;
            }
            .pagination a, .pagination span {
                padding: 10px 15px;
            }
        }
    </style>
    </head>
    <table>
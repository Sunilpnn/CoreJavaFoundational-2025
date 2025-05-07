<%@ page session="true" %>
<HTML>
<BODY>
<style>
        body {
		background-image: url("https://as1.ftcdn.net/jpg/07/82/01/84/1000_F_782018423_8Y5BkW9uG1zj9vrZRsuai7J1BPcigWOo.jpg");
            background-size: cover; 
            background-repeat: no-repeat;
            background-position: center;
			font-family: Arial, sans-serif;
            color: white;
            height: 100vh;
            margin: 0;

            /* Centering with Flexbox */
            display: flex;
            align-items: center;
            justify-content: center;
        }

        form {
            padding: 20px;
            background: rgba(0, 0, 0, 0.6); /* semi-transparent background */
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.5);
            width: 300px;
        }

        input {
            display: block;
            margin-top: 10px;
            width: 100%;
            padding: 8px;
            border-radius: 4px;
            border: none;
        }

        h1, label {
            margin-bottom: 10px;
        }

        
    </style>
	<form action=storemessages.jsp>
<H1 style="font-size:20px;">ChatWorld</H1>
<LABEL for="name">Type Your Messages</LABEL>
<INPUT TYPE="text" NAME="chat">
<INPUT TYPE="submit" VALUE="send">
<INPUT TYPE="reset" VALUE="cancel">
</form>
</BODY>
</HTML>
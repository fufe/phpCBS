<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>phpCBS - Edit User Details</title>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="{$themepath}admin.css" />
    </head>

    <body>
        <h1>User details / Felhasználói adatok:</h1>
        <form action="{$SCRIPT_NAME}?action=itschedule_application_submit" method="post">
            <div id="data">
                <label for="hostname_man">Hostname (computer name / számítógép név):</label>
                <input type="text" name="hostname_man" id="hostname_man" value="" /><br />
                <p>Start menu -> Run -> Type "cmd" hit [ENTER] -> Type "hostname" in black window hit [ENTER] and copy hostname.</p>
                <p>Start menü -> Run -> Írd be: "cmd" [ENTER] -> Írd be: "hostname" a fekete ablakba és [ENTER] majd másold be a hostname-et.</p>
                <label for="deskphone">Telephone number / Telefonszám:</label>
                <input type="text" name="deskphone" id="deskphone" value="" /><br />

                <label for="mobilephone">Mobile phone number / Mobiltelefon szám:</label>
                <input type="text" name="mobilephone" id="mobilephone" value="" /><br />

                <label for="location">Location within building / Épületen belüli hely:</label>
                <input type="text" name="location" id="location" value="" /><br />

                <input type="hidden" name="devicetype" value="{$data.devicetype|escape}"/>
                <input type="hidden" name="eventdateid" value="{$data.eventdateid|escape}"/>

            </div>
            <div id="buttons">
                <input type="submit" name="submit" id="save" value="Submit" />
            </div>
        </form>

    </body>
</html>

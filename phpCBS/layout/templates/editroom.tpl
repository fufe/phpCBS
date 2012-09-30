<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Edit Room Details</title>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="{$themepath}admin.css" />
    </head>

    <body>
        <form action="{$SCRIPT_NAME}?action=room_submit" method="post">
            <div id="data">
                <label for="shortname">Short name:</label>
                <input type="text" name="shortname" id="shortname" value="{$data.shortname|escape}" /><br />
                <label for="name">Name:</label>
                <input type="text" name="name" id="name" value="{$data.name|escape}" /><br />
                <label for="locationfloor">Floor:</label>
                <input type="text" name="locationfloor" id="locationfloor" value="{$data.locationfloor|escape}" /><br />
                <label for="locationwing">Wing:</label>
                <input type="text" name="locationwing" id="locationwing" value="{$data.locationwing|escape}" /><br />
                <label for="seatcount">Seat count:</label>
                <input type="text" name="seatcount" id="seatcount" value="{$data.seatcount|escape}" /><br />


                <label for="hasprojector">Projector</label>
                <input type="checkbox" name="hasprojector" id="hasprojector" /><br />
                <label for="haslcdtv">LCD TV</label>
                <input type="checkbox" name="haslcdtv" id="haslcdtv" /><br />
                <label for="haspc">PC</label>
                <input type="checkbox" name="haspc" id="haspc" /><br />
                <label for="haswirelesskbm">Wireless keyboard and mouse</label>
                <input type="checkbox" name="haswirelesskbm" id="haswirelesskbm" /><br />
                <label for="haspowerbar">Power Bar</label>
                <input type="checkbox" name="haspowerbar" id="haspowerbar" /><br />
                <label for="hasamplifier">Amplifier</label>
                <input type="checkbox" name="hasamplifier" id="hasamplifier" /><br />                


                <label for="projectortype">Projector Type</label>
                <input type="text" name="projectortype" id="projectortype" value="{$data.projectortype|escape}" /><br />
                <label for="projectorlamptime">Projector Lamp Time</label>
                <input type="text" name="projectorlamptime" id="projectorlamptime" value="{$data.projectorlamptime|escape}" /><br />
                <label for="amplifiertype">Amplifier Type</label>
                <input type="text" name="amplifiertype" id="amplifiertype" value="{$data.amplifiertype|escape}" /><br />
                <label for="speakers">Speakers</label>
                <input type="text" name="speakers" id="speakers" value="{$data.speakers|escape}" /><br />
                <label for="screensize">Screen Size</label>
                <input type="text" name="screensize" id="screensize" value="{$data.screensize|escape}" /><br />

                <label for="misc">Misc</label>
                <textarea name="misc" id="misc" rows="5" cols="60">{$data.misc|escape}</textarea><br />

                <input type="hidden" name="id" value="{$data.id|escape}"/>

            </div>
            <div id="buttons">
                <input type="submit" name="submit" id="save" value="Save" />
                <input type="button" name="reset" id="reset" value="Reset" />
            </div>
        </form>

    </body>
</html>

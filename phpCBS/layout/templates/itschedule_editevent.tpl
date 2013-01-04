<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>phpCBS - Edit Event Details</title>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="{$themepath}admin.css" />
    </head>

    <body>
        <form action="{$SCRIPT_NAME}?action=itschedule_editevent_submit" method="post">
            <div id="data">
                <label for="name">Name:</label>
                <input type="text" name="name" id="name" value="{$data.name|escape}" /><br />
                <label for="description">Description:</label>
                <input type="text" name="description" id="description" value="{$data.description|escape}" /><br />
                <label for="datestart">Start Date:</label>
                <input type="text" name="datestart" id="datestart" value="{$data.datestart|escape}" /><br />
                <label for="dateend">End Date:</label>
                <input type="text" name="dateend" id="dateend" value="{$data.dateend|escape}" /><br />

                <label for="isweekends">Is Weekends:</label>
                <input type="text" name="isweekends" id="isweekends" value="{$data.isweekends|escape}" /><br />

                <label for="maxapplicationsperuser">maxapplicationsperuser</label>
                <input type="text" name="maxapplicationsperuser" id="maxapplicationsperuser" value="{$data.maxapplicationsperuser|escape}" /><br />
                <label for="maxdesktopperday">maxdesktopperday</label>
                <input type="text" name="maxdesktopperday" id="maxdesktopperday" value="{$data.maxdesktopperday|escape}" /><br />
                <label for="maxlaptopperday">maxlaptopperday</label>
                <input type="text" name="maxlaptopperday" id="maxlaptopperday" value="{$data.maxlaptopperday|escape}" /><br />

                <label for="isenabled">isenabled</label>
                <input type="text" name="isenabled" id="isenabled" value="{$data.isenabled|escape}" /><br />

                <input type="hidden" name="id" value="{$data.id|escape}"/>

            </div>
            <div id="buttons">
                <input type="submit" name="submit" id="save" value="{$data.formaction|escape}" />
            </div>
        </form>

    </body>
</html>

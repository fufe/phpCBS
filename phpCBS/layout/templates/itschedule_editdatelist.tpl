<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>phpCBS - Edit Date List</title>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="{$themepath}admin.css" />
    </head>

    <body>
        <h1>Event Dates:</h1>            
        <form action="{$SCRIPT_NAME}?action=itschedule_editeventdates_submit" method="post">
            <div id="data">
                <table>
                    <tr>
                        <th>Date</th>
                        <th>Enabled</th>
                        <th>Max Laptops</th>
                        <th>Max Desktops</th>
                    </tr>                   
                    {foreach from=$list item=i}
                        <tr>
                            <td>{$i.eventdate}</td>
                            <td><input type="checkbox" name="isenabled[{$i.id}]" value="1" {if $i.isenabled}checked{/if}/></td>
                            <td><input type="text" name="maxlaptops[{$i.id}]" value="{$i.maxlaptops}" /></td>
                            <td><input type="text" name="maxdesktops[{$i.id}]" value="{$i.maxdesktops}" /></td>
                        </tr>
                    {/foreach}
                </table>

                <div id="buttons">
                    <input type="submit" name="submit" id="save" value="Update" />
                </div>
        </form>
    </body>
</html>

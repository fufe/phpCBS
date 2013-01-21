<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>phpCBS - Show Applications</title>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="{$themepath}admin.css" />
    </head>

    <body>
        <h1>Current applications:</h1>            
        <form action="{$SCRIPT_NAME}?action=itschedule_deleteapplication" method="post">
            <div id="data">
                <table>
                    <tr>
                        <th>Date</th>
                        <th>Username</th>
                        <th>Hostname</th>
                        <th>Hostname man</th>
                        <th>Device type</th>
                        <th>Desk phone</th>
                        <th>Mobile phone</th>
                        <th>Location</th>
                        <th>Delete</th>
                    </tr>                   
                    {foreach from=$applist item=i}
                        <tr>
                            <td>{$i.eventdate}</td>
                            <td>{$i.username}</td>
                            <td>{$i.devicetype}</td>
                            <td>{$i.hostname}</td>
                            <td>{$i.hostname_man}</td>
                            <td>{$i.deskphone}</td>
                            <td>{$i.mobilephone}</td>
                            <td>{$i.location}</td>
                            <td width="50px"><input type="checkbox" name="idstodelete[]" value="{$i.id}" /></td>
                        </tr>
                    {/foreach}
                </table>
            </div>
            <div id="buttons">
                <input type="submit" name="submit" id="delete" value="Delete Selected" />
            </div>
        </form>
    </body>
</html>

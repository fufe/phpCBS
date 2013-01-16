<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>phpCBS - Edit Event Details</title>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="{$themepath}admin.css" />
    </head>

    <body>
        <h1>Available Events:</h1>            
        <ul>
        {foreach from=$list item=i}
            {if $i.isenabled or $admin}
            <li><a href="index.php?action=itschedule_showeventdates&id={$i.id}">{$i.name}</a>{if $admin} ----- <a href="index.php?action=itschedule_editevent&id={$i.id}">Edit Event</a> ----- <a href="index.php?action=itschedule_editeventdates&id={$i.id}">Edit Date List</a>{/if}</li>
            <ul>
                <li>{$i.description}</li>
            </ul>
            {/if}
        {/foreach}
        {if $admin}
        <li><a href="index.php?action=itschedule_addevent">Add new event</a></li>
        {/if}
        </ul>
    </body>
</html>

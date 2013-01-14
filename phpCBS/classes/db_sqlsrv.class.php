<?php

/*
 * Database class for MS SQL PDO object.
 * 
 */

class db_sqlsrv {

    // database object
    var $dbh = null;

    /**
     * class constructor
     */
    function __construct($config = array()) {
        // instantiate the pdo object
        try {
            $dsn = "{$config['db_engine']}:server={$config['db_server']};database={$config['db_database']}";
            $this->dbh = new PDO($dsn, $config['db_username'], $config['db_password']);
            $this->dbh->query('SET NAMES utf8');
        } catch (PDOException $e) {
            print "Error!: " . $e->getMessage();
            die();
        }
    }
    
    function getITScheduleEventsList(){
        $sth = $this->dbh->query("SELECT * FROM itschedule_events");
        while ($row = $sth->fetch (PDO::FETCH_ASSOC)){
            $list[] = $row;
        }
        return $list;
    }
    
    function getITScheduleEventDetailsById($id){
        $sth = $this->dbh->query("SELECT * FROM itschedule_events WHERE id=$id");
        $data = $sth->fetch (PDO::FETCH_ASSOC);
        return $data;
    }
    
    function addITScheduleEvent($data){
        $sth = $this->dbh->prepare("INSERT INTO itschedule_events (name,description,datestart,dateend,isweekends,maxapplicationsperuser,maxdesktopperday,maxlaptopperday,isenabled) 
            VALUES (:name,:description,:datestart,:dateend,:isweekends,:maxapplicationsperuser,:maxdesktopperday,:maxlaptopperday,:isenabled)");
        $sth->bindParam(":name", $data["name"]);
        $sth->bindParam(":description", $data["description"]);
        $sth->bindParam(":datestart", $data["datestart"]);
        $sth->bindParam(":dateend", $data["dateend"]);
        $sth->bindParam(":isweekends", $data["isweekends"]);
        $sth->bindParam(":maxapplicationsperuser", $data["maxapplicationsperuser"]);
        $sth->bindParam(":maxdesktopperday", $data["maxdesktopperday"]);
        $sth->bindParam(":maxlaptopperday", $data["maxlaptopperday"]);
        $sth->bindParam(":isenabled", $data["isenabled"]);
        $result = $sth->execute();
        if ($result) {
            return $this->dbh->lastInsertId ();
        }
        else return FALSE;
    }

    function updateITScheduleEvent($data){
        $sth = $this->dbh->prepare("UPDATE itschedule_events SET name=:name,description=:description,datestart=:datestart,dateend=:dateend,
            isweekends=:isweekends,maxapplicationsperuser=:maxapplicationsperuser,maxdesktopperday=:maxdesktopperday,
            maxlaptopperday=:maxlaptopperday,isenabled=:isenabled
            WHERE id=:id");
        $sth->bindParam(":name", $data["name"]);
        $sth->bindParam(":description", $data["description"]);
        $sth->bindParam(":datestart", $data["datestart"]);
        $sth->bindParam(":dateend", $data["dateend"]);
        $sth->bindParam(":isweekends", $data["isweekends"]);
        $sth->bindParam(":maxapplicationsperuser", $data["maxapplicationsperuser"]);
        $sth->bindParam(":maxdesktopperday", $data["maxdesktopperday"]);
        $sth->bindParam(":maxlaptopperday", $data["maxlaptopperday"]);
        $sth->bindParam(":isenabled", $data["isenabled"]);
        $sth->bindParam(":id", $data["id"]);
        return $sth->execute();
    }
    
    function getITScheduleUserDetails($username){
        $sth = $this->dbh->query("SELECT * FROM itschedule_users WHERE account='$username'");
        return $sth->fetch (PDO::FETCH_ASSOC);      
    }
    
    function addITScheduleEventDates($eventid, $dates = array()){
        $result = true;
        $sth = $this->dbh->prepare("INSERT INTO itschedule_event_dates (eventid,eventdate,isenabled,maxlaptops,maxdesktops) 
            VALUES (:eventid,:eventdate,:isenabled,:maxlaptops,:maxdesktops)");
        $sth->bindParam(":eventid", $eventid);
        foreach ($dates as $day) {
            $sth->bindParam(":eventdate", $day["date"]);
            $sth->bindParam(":isenabled", $day["isenabled"]);
            $sth->bindParam(":maxlaptops", $day["maxlaptops"]);
            $sth->bindParam(":maxdesktops", $day["maxdesktops"]);
            if (!$sth->execute()) $result = FALSE;
        }
        return $result;
    }
    
    function getITScheduleEventDateListByID($eventid){
        $sth = $this->dbh->query("SELECT id,eventdate,isenabled,maxlaptops,maxdesktops FROM itschedule_event_dates WHERE eventid=$eventid");
        while ($row = $sth->fetch (PDO::FETCH_ASSOC)){
            $data[] = $row;
        }
        return $data;        
    }
    
    function updateITScheduleEventDates($data = array()){
        $result = TRUE;
        $sth = $this->dbh->prepare("UPDATE itschedule_event_dates SET isenabled=:isenabled,maxlaptops=:maxlaptops,maxdesktops=:maxdesktops WHERE id=:id");
        foreach ($data as $item) {
            $sth->bindParam(":id", $item["id"]);
            $sth->bindParam(":isenabled", $item["isenabled"]);
            $sth->bindParam(":maxlaptops", $item["maxlaptops"]);
            $sth->bindParam(":maxdesktops", $item["maxdesktops"]);
            if (!$sth->execute()) $result = FALSE;
        }
        return $result;
    }
}

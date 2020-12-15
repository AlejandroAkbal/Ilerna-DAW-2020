<?php
class DB_Connect {
    protected $host;
    protected $database;
    protected $user;
    protected $password;

    protected $db_connection;

    public function DB_Connect($host = "localhost", $database = "M07", $user = "root", $password = "password") {
        $this->host = $host;
        $this->database = $database;
        $this->user = $user;
        $this->password = $password;  
    }
    
    public function create_connection() {
        $db_conn = new mysqli($this->host, $this->user, $this->password, $this->database);

        if ($db_conn->connect_errno) {
            $message = "Connection to database failed: {$db_conn->connect_error}";
            
            die($message);
        }

        $db_conn->set_charset("UTF8");

        $this->db_connection = $db_conn;
    }

    public function get_connection() {
        return $this->db_connection;
    }
}
?>
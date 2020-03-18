<?php

use Slim\App;
use Slim\Http\Request;
use Slim\Http\Response;

return function (App $app) {
    $container = $app->getContainer();

    // get semua daftarsiswa
    $app->get('/api_get_daftarsiswa', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM daftarsiswa");
        $sth->execute();
        $todos = $sth->fetchAll();
        return $this->response->withJson($todos);
    });

     // Insert daftarsiswa
    $app->post('/api_post_daftarsiswa', function ($request, $response) {
        // get the parameter from the form submit
        $id = $request->getParam('id');
        $nama = $request->getParam('nama');
        $password = $request->getParam('password');
        $email = $request->getParam('email');

        $sql = "INSERT INTO daftarsiswa (id, nama, password, email) VALUES (:id, :nama, :password, :email)";
        $sth = $this->db->prepare($sql);
        $sth->bindParam(':id', $id);
        $sth->bindParam(':nama', $nama);
        $sth->bindParam(':password', $password);
        $sth->bindParam('email', $email);
        $sth->execute();
        $input['id'] = $this->db->lastInsertId();
        $input['nama'] = $nama;
        $input['password'] = $password;
        $input['email'] = $email;
        return $this->response->withJson($input);
    });

    // DELETE daftarsiswa
    $app->post('/api_delete_daftarsiswa', function ($request, $response) {
        $id = $request->getParam('id');
       $sth = $this->db->prepare("DELETE FROM daftarsiswa WHERE id=:id");
       $sth->bindParam("id", $id);
       $sth->execute();
       return $this->response->withJson($id);
   });

    // UPDATE daftarsiswa
    $app->post('/api_update_daftarsiswa', function ($request, $response) {
        $id = $request->getParam('id');
        $nama = $request->getParam('nama');
        $password = $request->getParam('password');
        $email = $request->getParam('email');
        
        $sql = "UPDATE daftarsiswa SET nama=:nama, password=:password, email=:email WHERE id=:id";
        $sth = $this->db->prepare($sql);
        $sth->bindParam("id", $id);
        $sth->bindParam(':nama', $nama);
        $sth->bindParam(':password', $password);
        $sth->bindParam('email', $email);
        $sth->execute();
        $input['id'] = $id;
        $input['nama'] = $nama;
        $input['password'] = $password;
        $input['email'] = $email;
        return $this->response->withJson($input);
    });

    // get semua mata pelajaran
    $app->get('/api_get_mapel', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM mapel");
        $sth->execute();
        $todos = $sth->fetchAll();
        return $this->response->withJson($todos);
    });
    
    // Insert mata pelajaran
    $app->post('/api_post_mapel', function ($request, $response) {

        // get the parameter from the form submit
        $id = $request->getParam('id_mapel');
        $nama_mapel = $request->getParam('nama_mapel');

        $sql = "INSERT INTO mapel(id_mapel, nama_mapel) VALUES (:id_mapel, :nama_mapel)";
        $sth = $this->db->prepare($sql);
        $sth->bindParam(':id_mapel', $id_mapel);
        $sth->bindParam(':nama_mapel', $nama_mapel);
        $sth->execute();
        $input['id_mapel'] = $this->db->lastInsertId();
        $input['nama_mapel'] = $nama_mapel;
        return $this->response->withJson($input);
    });
};
        

<?php

use Slim\App;
use Slim\Http\Request;
use Slim\Http\Response;
use Slim\Http\UploadedFile; //using getUploadedFile

return function (App $app) {
    $container = $app->getContainer();

    $app->get('/', function ($request, $response, $args) {
        // Render file upload form
        return $this->renderer->render($response, 'index.phtml', $args);
    });

    // LOGIN
    $app->post('/api_post_loginuser', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT ifnull(COUNT(*), 0) AS status, id, user.id_role AS roleid, nama, email, nama_role FROM user INNER JOIN role ON user.id_role = role.id_role WHERE email =:email AND password =:password");
        $email = $request->getParam('email');
        $password = $request->getParam('password');
        $sth->bindParam(":email", $email);
        $sth->bindParam(":password", $password);
        $sth->execute();
        $todos = $sth->fetchAll(); // ini balikin array
        return $this->response->withJson($todos[0]);
    });

    // INSERT user
    $app->post('/api_post_user', function ($request, $response) {
        // get the parameter from the form submit
        $id = $request->getParam('id');
        $id_role = $request->getParam('id_role');
        $nama = $request->getParam('nama');
        $password = $request->getParam('password');
        $email = $request->getParam('email');

        $sql = "INSERT INTO user (id, id_role, nama, password, email) VALUES (:id, :id_role, :nama, :password, :email)";
        $sth = $this->db->prepare($sql);
        $sth->bindParam(':id', $id);
        $sth->bindParam(':id_role', $id_role);
        $sth->bindParam(':nama', $nama);
        $sth->bindParam(':password', $password);
        $sth->bindParam(':email', $email);
        $sth->execute();
        $input['id'] = $this->db->lastInsertId();
        $input['id_role'] = $id_role;
        $input['nama'] = $nama;
        $input['password'] = $password;
        $input['email'] = $email;
        return $this->response->withJson($input);
    });
    
    // UPDATE user
    $app->put("/api_update_user/{id}", function (Request $request, Response $response, $args){
        $input= $request->getParsedBody();
        $sql = "UPDATE user SET nama=:nama WHERE id=:id";
        $sth = $this->db->prepare($sql);
        $sth->bindParam("id", $args['id']);
        $sth->bindParam("nama", $input['nama']);
        $sth->execute();
        $input['id'] = $args['id'];
        return $this->response->withJson($input);
    });

     // DELETE daftarsiswa
     $app->delete('/api_delete_user', function ($request, $response) {
        $id = $request->getParam('id');
        $sth = $this->db->prepare("DELETE FROM daftarsiswa WHERE id=:id");
        $sth->bindParam(":id", $id);
        $sth->execute();
        return $this->response->withJson($id);
    });

    // GET semua mata pelajaran
    $app->get('/api_get_mapel', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM mapel");
        $sth->execute();
        $todos = $sth->fetchAll();
        return $this->response->withJson($todos);
    });
    
    // INSERT mata pelajaran
    $app->post('/api_post_mapel', function ($request, $response) {

        // get the parameter from the form submit
        $id_mapel = $request->getParam('id_mapel');
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

     // UPDATE mata pelajaran
    $app->put("/api_update_mapel/{id}", function (Request $request, Response $response, $args){
        $id = $args["id"];
        $nama_mapel = $request->getParsedBody();
        $sql = "UPDATE mapel SET nama_mapel=:nama_mapel WHERE id_mapel=:id";
        $stmt = $this->db->prepare($sql);
        
        $data = [
            ":id" => $id,
            ":nama_mapel" => $nama_mapel["nama_mapel"]
        ];
    
        if($stmt->execute($data))
           return $response->withJson(["status" => "success", "data" => "1"], 200);
        
        return $response->withJson(["status" => "failed", "data" => "0"], 400);
    });

     // DELETE mata pelajaran
     $app->delete("/api_delete_mapel/{id}", function (Request $request, Response $response, $args){
        $id_mapel = $args["id"];
        $sql = "DELETE FROM mapel WHERE id_mapel=:id";
        $stmt = $this->db->prepare($sql);
    
        $data = [
            ":id" => $id_mapel
        ];
        
        if($stmt->execute($data)){
        return $response->withJson(["status" => "success", "data" => "1"], 200);
        }
        return $response->withJson(["status" => "failed", "data" => "0"], 400); 
    });

    // GET materi
    $app->get('/api_get_materi', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM materi");
        $sth->execute();
        $todos = $sth->fetchAll();
        return $this->response->withJson($todos);
    }); 

     // GET materi by idmapel
     $app->get('/api_get_materi/[{id_mapel}]', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM materi WHERE id_mapel=:id_mapel");
        $sth->bindParam("id_mapel", $args['id_mapel']);
        $sth->execute();
        $todos = $sth->fetchAll();
        return $this->response->withJson($todos);
    });

    // UPLOAD materi
    $app->post('/api_post_materi', function(Request $request, Response $response, $args) {
        $uploadedFiles = $request->getUploadedFiles();
        $judul_materi = $request->getParam('judul_materi');
        $id_mapel = $request->getParam('id_mapel');
        // handle single input with single file upload
        $uploadedFile = $uploadedFiles['file'];
        
        if (!$uploadedFile == null){
        if ($uploadedFile->getError() === UPLOAD_ERR_OK) {
            
            $extension = pathinfo($uploadedFile->getClientFilename(), PATHINFO_EXTENSION);
            
            // ubah nama file dengan random karakter
            $basename = bin2hex(random_bytes(8));
            $filename = sprintf('%s.%0.8s', $basename, $extension);
            
            $directory = $this->get('settings')['upload_directory'];
            $uploadedFile->moveTo($directory . DIRECTORY_SEPARATOR . $filename);
    
            // simpan nama file ke database
            $sql = "INSERT INTO materi(judul_materi, id_mapel, nama_materi) VALUES (:judul_materi, :id_mapel, :nama_materi)";
            $stmt = $this->db->prepare($sql);
            $params = [
                ":judul_materi" => $judul_materi,
                ":id_mapel" => $id_mapel,
                ":nama_materi" => $filename
            ];
            //if($judul_materi != NULL && $filename != NULL){
            if($stmt->execute($params)){
                $url = $request->getUri()->getBaseUrl()."/uploads/".$filename;
                return $response->withJson(["status" => 1, "materi" => $judul_materi, "file" => $url], 200);
            }    else{
                return $response->withJson(["status" => 0, "materi" => "", "file" => ""], 400);
            }
        }
    }
    });

    // UPDATE materi
    $app->put("/api_update_materi/{id}", function (Request $request, Response $response, $args){
        $id = $args["id"];
        $judul_mapel = $request->getParsedBody();
        $sql = "UPDATE materi SET judul_materi=:judul_materi WHERE id_materi=:id";
        $stmt = $this->db->prepare($sql);
        
        $data = [
            ":id" => $id,
            ":judul_materi" => $judul_mapel["judul_materi"]
        ];
    
        if($stmt->execute($data))
           return $response->withJson(["status" => "success", "data" => "1"], 200);
        
        return $response->withJson(["status" => "failed", "data" => "0"], 400);
    });

    // DELETE materi
    $app->delete("/api_delete_materi/{id}", function (Request $request, Response $response, $args){
        $id_materi = $args["id"];
        $sql = "DELETE FROM materi WHERE id_materi=:id";
        $stmt = $this->db->prepare($sql);
    
        $data = [
            ":id" => $id_materi
        ];
        
        if($stmt->execute($data)){
        return $response->withJson(["status" => "success", "data" => "1"], 200);
        }
        return $response->withJson(["status" => "failed", "data" => "0"], 400); 
    });

    // GET jenjang
    $app->get('/api_get_jenjang', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM jenjang");
        $sth->execute();
        $todos = $sth->fetchAll();
        return $this->response->withJson($todos);
    });

    // GET mapelsoal by jenjang
    $app->get('/api_get_mapelsoal/[{id_jenjang}]', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM mapelsoal WHERE id_jenjang=:id_jenjang");
        $sth->bindParam("id_jenjang", $args['id_jenjang']);
        $sth->execute();
        $todos = $sth->fetchAll();
        return $this->response->withJson($todos);
    });

     // GET semua mapelsoal
     $app->get('/api_get_mapelsoal', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM mapelsoal INNER JOIN jenjang ON jenjang.id_jenjang = mapelsoal.id_jenjang");
        $sth->execute();
        $todos = $sth->fetchAll();
        return $this->response->withJson($todos);
    });
    
    // INSERT mapelsoal
    $app->post('/api_post_mapelsoal', function ($request, $response) {

        // get the parameter from the form submit
        $id_mapelsoal = $request->getParam('id_mapelsoal');
        $id_jenjang = $request->getParam('id_jenjang');
        $nama_mapelsoal = $request->getParam('nama_mapelsoal');

        $sql = "INSERT INTO mapelsoal(id_mapelsoal, id_jenjang, nama_mapelsoal) VALUES (:id_mapelsoal, :id_jenjang, :nama_mapelsoal)";
        $sth = $this->db->prepare($sql);
        $sth->bindParam(':id_mapelsoal', $id_mapelsoal);
        $sth->bindParam(':id_jenjang', $id_jenjang);
        $sth->bindParam(':nama_mapelsoal', $nama_mapelsoal);
        $sth->execute();
        $input['id_mapelsoal'] = $this->db->lastInsertId();
        $input['id_jenjang'] = $id_jenjang;
        $input['nama_mapelsoal'] = $nama_mapelsoal;
        return $this->response->withJson($input);
    });

     // UPDATE mapelsoal
    $app->put("/api_update_mapelsoal/{id}", function (Request $request, Response $response, $args){
        $id = $args["id"];
        $nama_mapelsoal = $request->getParsedBody();
        $sql = "UPDATE mapelsoal SET nama_mapelsoal=:nama_mapelsoal WHERE id_mapelsoal=:id";
        $stmt = $this->db->prepare($sql);
        
        $data = [
            ":id" => $id,
            ":nama_mapelsoal" => $nama_mapelsoal["nama_mapelsoal"]
        ];
    
        if($stmt->execute($data))
           return $response->withJson(["status" => "success", "data" => "1"], 200);
        
        return $response->withJson(["status" => "failed", "data" => "0"], 400);
    });

    // DELETE mapelsoal
    $app->delete("/api_delete_mapelsoal/{id}", function (Request $request, Response $response, $args){
        $id_mapelsoal = $args["id"];
        $sql = "DELETE FROM mapelsoal WHERE id_mapelsoal=:id";
        $stmt = $this->db->prepare($sql);
    
        $data = [
            ":id" => $id_mapelsoal
        ];
        
        if($stmt->execute($data)){
        return $response->withJson(["status" => "success", "data" => "1"], 200);
        }
        return $response->withJson(["status" => "failed", "data" => "0"], 400); 
    });

    
    // GET kelas
    $app->get('/api_get_kelas', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM kelas");
        $sth->execute();
        $todos = $sth->fetchAll();
        return $this->response->withJson($todos);
    });

     // GET kelas
     $app->get('/api_get_kelas/{id}', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM kelas WHERE id_jenjang=:id");
        $sth->bindParam("id", $args['id']);
        $sth->execute();
        $todos = $sth->fetchAll();
        return $this->response->withJson($todos);
    });
  
    // GET soal
    $app->get('/api_get_soal', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM soal INNER JOIN kelas ON kelas.id_kelas = soal.id_kelas");
        $sth->execute();
        $todos = $sth->fetchAll();
        return $this->response->withJson($todos);
    });

     // GET soal by mapel
     $app->get('/api_get_soal/[{id_mapelsoal}]', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM soal INNER JOIN kelas ON kelas.id_kelas = soal.id_kelas INNER JOIN jenjang ON jenjang.id_jenjang = soal.id_jenjang WHERE id_mapelsoal=:id_mapelsoal");
        $sth->bindParam("id_mapelsoal", $args['id_mapelsoal']);
        $sth->execute();
        $todos = $sth->fetchAll();
        return $this->response->withJson($todos);
    });

    // GET soal by mapel
     $app->get('/api_get_soalbyid/[{id}]', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM soal INNER JOIN kelas ON kelas.id_kelas = soal.id_kelas WHERE id_soal=:id");
        $sth->bindParam("id", $args['id']);
        $sth->execute();
        $todos = $sth->fetchAll();
        return $this->response->withJson($todos);
    });


    // GET pembahasan soal by idkuis
    $app->get('/api_get_pembahasansoal/[{id_kuis}]', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM soal INNER JOIN kelas ON kelas.id_kelas = soal.id_kelas INNER JOIN jenjang ON jenjang.id_jenjang = soal.id_jenjang WHERE id_kuis=:id_kuis");
        $sth->bindParam("id_kuis", $args['id_kuis']);
        $sth->execute();
        $todos = $sth->fetchAll();
        return $this->response->withJson($todos);
    });

    // INSERT soal
    $app->post('/api_post_soal', function ($request, $response) {

        $id_soal = $request->getParam('id_soal');
        $id_jenjang = $request->getParam('id_jenjang');
        $id_mapelsoal = $request->getParam('id_mapelsoal');
        $id_kelas = $request->getParam('id_kelas');
        $nama_soal = $request->getParam('nama_soal');

        $sql = "INSERT INTO soal(id_soal, id_jenjang, id_mapelsoal, id_kelas, nama_soal) VALUES (:id_soal, :id_jenjang, :id_mapelsoal, :id_kelas, :nama_soal)";
        $sth = $this->db->prepare($sql);
        $sth->bindParam(':id_soal', $id_soal);
        $sth->bindParam(':id_jenjang', $id_jenjang);
        $sth->bindParam(':id_mapelsoal', $id_mapelsoal);
        $sth->bindParam(':id_kelas', $id_kelas);
        $sth->bindParam(':nama_soal', $nama_soal);
        $sth->execute();
        $input['id_soal'] = $this->db->lastInsertId();
        $input['id_jenjang'] = $id_jenjang;
        $input['id_mapelsoal'] = $id_mapelsoal;
        $input['id_kelas'] = $id_kelas;
        $input['nama_soal'] = $nama_soal;
        return $this->response->withJson($input);
    });

     // DELETE soal
     $app->delete("/api_delete_soal/{id}", function (Request $request, Response $response, $args){
        $id_soal = $args["id"];
        $sql = "DELETE FROM soal WHERE id_soal=:id";
        $stmt = $this->db->prepare($sql);
    
        $data = [
            ":id" => $id_soal
        ];
        
        if($stmt->execute($data)){
        return $response->withJson(["status" => "success", "data" => "1"], 200);
        }
        return $response->withJson(["status" => "failed", "data" => "0"], 400); 
    });

     // UPDATE soal
    $app->put("/api_update_soal/{id}", function (Request $request, Response $response, $args){
        $id = $args["id"];
        $new_soal = $request->getParsedBody();
        $sql = "UPDATE soal SET id_kelas=:id_kelas, nama_soal=:nama_soal WHERE id_soal=:id";
        $stmt = $this->db->prepare($sql);
        
        $data = [
            ":id" => $id,
            ":id_kelas" => $new_soal["id_kelas"],
            ":nama_soal" => $new_soal["nama_soal"]
        ];
    
        if($stmt->execute($data))
           return $response->withJson(["status" => "success", "data" => "1"], 200);
        
        return $response->withJson(["status" => "failed", "data" => "0"], 400);
    });

    // GET kuis by idsoal
    $app->get('/api_get_kuis/[{id_soal}]', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM kuis WHERE id_soal=:id_soal");
        $sth->bindParam("id_soal", $args['id_soal']);
        $sth->execute();
        $todos = $sth->fetchAll();
        return $this->response->withJson($todos);
    });

     // INSERT kuis
     $app->post('/api_post_kuis', function ($request, $response) {
        $id_kuis = $request->getParam('id_kuis');
        $id_soal = $request->getParam('id_soal');

        $sql = "INSERT INTO kuis(id_kuis, id_soal) VALUES (:id_kuis, :id_soal)";
        $sth = $this->db->prepare($sql);
        $sth->bindParam(':id_kuis', $id_kuis);
        $sth->bindParam(':id_soal', $id_soal);
        $sth->execute();
        $input['id_kuis'] = $this->db->lastInsertId();
        $input['id_soal'] = $id_soal;
        return $this->response->withJson($input);
    });

    // DELETE kuis
    $app->delete("/api_delete_kuis/{id}", function (Request $request, Response $response, $args){
        $id_soal = $args["id"];
        $sql = "DELETE FROM kuis WHERE id_kuis=:id";
        $stmt = $this->db->prepare($sql);
    
        $data = [
            ":id" => $id_soal
        ];
        
        if($stmt->execute($data)){
        return $response->withJson(["status" => "success", "data" => "1"], 200);
        }
        return $response->withJson(["status" => "failed", "data" => "0"], 400); 
    });

    // GET detailkuis by idkuis
    $app->get('/api_get_detailkuis/[{id_kuis}]', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM detailkuis RIGHT JOIN kuis ON kuis.id_kuis = detailkuis.id_kuis WHERE kuis.id_kuis=:id_kuis");
        $sth->bindParam("id_kuis", $args['id_kuis']);
        $sth->execute();
        $todos = $sth->fetchAll();
        return $this->response->withJson($todos);
    });

    // GET detailkuis by idsoal
    $app->get('/api_get_detailkuisbysoal/[{id_soal}]', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM detailkuis RIGHT JOIN kuis ON kuis.id_kuis = detailkuis.id_kuis WHERE id_soal=:id_soal");
        $sth->bindParam("id_soal", $args['id_soal']);
        $sth->execute();
        $todos = $sth->fetchAll();
        return $this->response->withJson($todos);
    });

    // GET detailkuis
    $app->get('/api_get_detailkuis', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM detailkuis RIGHT JOIN kuis ON kuis.id_kuis = detailkuis.id_kuis");
        $sth->bindParam("id_kuis", $args['id_kuis']);
        $sth->execute();
        $todos = $sth->fetchAll();
        return $this->response->withJson($todos);
    });

    // POST detailkuis
    $app->post('/api_post_detailkuis', function(Request $request, Response $response, $args) {
        $uploadedFiles = $request->getUploadedFiles();
        $id_kuis = $request->getParam('id_kuis');
        $jawaban = $request->getParam('jawaban');
        // handle single input with single file upload
        $uploadedFile = $uploadedFiles['file'];
        
        if (!$uploadedFile == null){
        if ($uploadedFile->getError() === UPLOAD_ERR_OK) {
            
            $extension = pathinfo($uploadedFile->getClientFilename(), PATHINFO_EXTENSION);
            
            // ubah nama file dengan random karakter
            $basename = bin2hex(random_bytes(8));
            $filename = sprintf('%s.%0.8s', $basename, $extension);
            
            $directory = $this->get('settings')['upload_directory'];
            $uploadedFile->moveTo($directory . DIRECTORY_SEPARATOR . $filename);
            $url = $request->getUri()->getBaseUrl()."/uploads/".$filename;
            // simpan nama file ke database
            $sql = "INSERT INTO detailkuis(id_kuis, img_pertanyaan, jawaban) VALUES (:id_kuis, :img_pertanyaan, :jawaban)";
            $stmt = $this->db->prepare($sql);
            $params = [
                ":id_kuis" => $id_kuis,
                ":img_pertanyaan" => $filename,
                ":jawaban" => $jawaban
            ];
            
            if($stmt->execute($params)){
                return $response->withJson(["status" => 1, "filename" => $filename, "url" => $url], 200);
            }    else{
                return $response->withJson(["status" => 0, "filename" => "", "url" => ""], 400);
            }
        }
    }
    });

    // UPDATE detailkuis
    $app->post('/api_update_detailkuis/{id}', function(Request $request, Response $response, $args) {
        $id = $args["id"];
        $uploadedFiles = $request->getUploadedFiles();
        $new_detailkuis= $request->getParsedBody();

        $uploadedFile = $uploadedFiles['file'];
        
        if (!$uploadedFile == null){
        if ($uploadedFile->getError() === UPLOAD_ERR_OK) {
            
            $extension = pathinfo($uploadedFile->getClientFilename(), PATHINFO_EXTENSION);
            
            // ubah nama file dengan random karakter
            $basename = bin2hex(random_bytes(8));
            $filename = sprintf('%s.%0.8s', $basename, $extension);
            
            $directory = $this->get('settings')['upload_directory'];
            $uploadedFile->moveTo($directory . DIRECTORY_SEPARATOR . $filename);
            $url = $request->getUri()->getBaseUrl()."/uploads/".$filename;
            // simpan nama file ke database
            $sql = "UPDATE detailkuis SET img_pertanyaan=:img_pertanyaan, jawaban=:jawaban WHERE id_detailkuis=:id";
            $stmt = $this->db->prepare($sql);
            $data = [
                ":id" => $id,
                ":img_pertanyaan" => $filename,
                ":jawaban" => $new_detailkuis["jawaban"]
            ];
        
            if($stmt->execute($data))
               return $response->withJson(["status" => 1, "filename" => $filename, "url" => $url], 200);
            
            return $response->withJson(["status" => 1, "filename" => $filename, "url" => $url], 400);
        }
    }
    });

    // GET pembahasan by idsoal
    $app->get('/api_get_pembahasan/[{id}]', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM detailkuis INNER JOIN kuis ON kuis.id_kuis = detailkuis.id_kuis WHERE id_soal=:id");
        $sth->bindParam("id", $args['id']);
        $sth->execute();
        $todos = $sth->fetchAll();
        return $this->response->withJson($todos);
    });

     // GET tryout
     $app->get('/api_get_tryout', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM tryout");
        $sth->execute();
        $todos = $sth->fetchAll();
        return $this->response->withJson($todos);
    });
};
        

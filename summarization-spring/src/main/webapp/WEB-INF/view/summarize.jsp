<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%><!DOCTYPE html>
<!--
  This is a starter template page. Use this page to start your new project from
  scratch. This page gets rid of all links and provides the needed markup only.
  -->
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>ABSTAT</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="css/bootstrap.min.css" type = "text/css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" type = "text/css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="css/ionicons.min.css" type = "text/css">
    <!-- Theme style -->
    <link rel="stylesheet" href="css/AdminLTE.min.css">
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
      page. However, you can choose any other skin. Make sure you
      apply the skin class to the body tag so the changes take effect. -->
    <link rel="stylesheet" href="css/skinblue.min.css" type = "text/css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Google Font -->
    <link rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  </head>
  <!--
    BODY TAG OPTIONS:
    =================
    Apply one or more of the following classes to get the
    desired effect
    |---------------------------------------------------------|
    | SKINS         | skin-blue                               |
    |               | skin-black                              |
    |               | skin-purple                             |
    |               | skin-yellow                             |
    |               | skin-red                                |
    |               | skin-green                              |
    |---------------------------------------------------------|
    |LAYOUT OPTIONS | fixed                                   |
    |               | layout-boxed                            |
    |               | layout-top-nav                          |
    |               | sidebar-collapse                        |
    |               | sidebar-mini                            |
    |---------------------------------------------------------|
    -->
  <body class="hold-transition skin-blue fixed sidebar-mini">
    <div class="wrapper">
    <!-- Main Header -->
    <header class="main-header">
      <!-- Logo -->
      <a href="home" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"> <img src="img/bicocca.png" width="50" height="50"> </span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>ABSTAT</b></span>
      </a>
      <!-- Header Navbar -->
      <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
        </a>
      </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
      <!-- sidebar: style can be found in sidebar.less -->
      <section class="sidebar">
        <!-- Sidebar Menu -->
        <ul class="sidebar-menu" data-widget="tree">
          <li class="header">ABSTAT</li>
          <!-- Optionally, you can add icons to the links -->
          <li class="active"><a href="home"><i class="fa fa-home"></i> <span>Overview</span></a></li>
          <li class="active"><a href="summarize"><i class="fa fa-gears"></i> <span>Summarize</span></a></li>
          <li class="active"><a href="dataLoading"><i class="fa fa-database"></i> <span>Consolidate</span></a></li>
          <li class="active"><a href="browse"><i class="fa fa-filter"></i> <span>Browse</span></a></li>
          <li class="active"><a href="search"><i class="fa fa-search"></i> <span>Search</span></a></li>
          <li class="active"><a href="management"><i class="fa fa-folder"></i> <span>Manage</span></a></li>
          <li class="active"><a href="apis"><i class="fa fa-link"></i> <span>APIs</span></a></li>
        </ul>
        <!-- /.sidebar-menu -->
      </section>
      <!-- /.sidebar -->
    </aside>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Main content -->
      <section class="content">
        <div class="row">
          <!-- left column -->
          <div class="col-md-6">
            <!-- /.box -->
            <!-- box summarization -->
            <div class="box box-info">
              <div class="box-header with-border">
                <h3 class="box-title">Summarize</h3>
              </div>
              <form:form action = "summarize/recap" modelAttribute = "submitConfig" method = "POST" >
                <div class="box-body">
                  <label>Choose a data set:</label>
                  <div class="form-group">
                    <form:select class="form-control select2" path="dsId">
                      <form:options items="${listDataset}" itemLabel="name" itemValue="id" />
                    </form:select>
                  </div>
                  <label>Choose an ontology:</label>
                  <div class="form-group">
                    <form:select class="form-control select2" path="listOntId" multiple = "multiple" id="ontologyCheckbox">
                      <form:option  value="empty_ontology">no ontology</form:option>
                      <form:options items="${listOntology}" itemLabel="name" itemValue="id" />
                    </form:select>
                  </div>
                  <label>Options:</label>
                  <div class="form-group">
                    <div class="checkbox">
                      <label>
                        <form:checkbox path="tipoMinimo"/>
                        Concept Minimalization
                      </label>
                    </div>
                    <div class="checkbox">
                      <label>
                        <form:checkbox path="inferences"/>
                        Inference
                      </label>
                    </div>
                    <div class="checkbox">
                      <label>
                        <form:checkbox path="cardinalita"/>
                        Cardinalities
                      </label>
                    </div>
                    <div class="checkbox">
                      <label>
                        <form:checkbox path="propertyMinimaliz"/>
                        Property Minimalization
                      </label>
                    </div>
                  </div>
                </div>
                <div class="box-footer">
                  <button type="submit" class="btn btn-primary" id="submitButton">Submit</button>
                </div>
              </form:form>
            </div>
          </div>
          <!--/.col (left) -->
          <!-- right column -->
          <div class="col-md-6">
            <!-- general form elements -->
            <div class="box box-info">
              <div class="box-header with-border">
                <h3 class="box-title">Upload a dataset</h3>
              </div>
              <!-- /.box-header -->
              <!-- form start -->
              <form role="form" method="POST" action="upload/ds" enctype="multipart/form-data">
                <div class="box-body">
                  <div class="form-group">
                    <!-- <label for="exampleInputFile">File input</label> -->
                    <input type="file" name="file">
                    <p class="help-block">Data sets must have ".nt" extension</p>
                  </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                  <button type="submit" class="btn btn-primary">Upload</button>
                </div>
              </form>
            </div>
            <div class="box box-info">
              <div class="box-header with-border">
                <h3 class="box-title">Upload an ontology</h3>
              </div>
              <!-- /.box-header -->
              <!-- form start -->
              <form role="form" method="POST" action="upload/ont" enctype="multipart/form-data">
                <div class="box-body">
                  <div class="form-group">
                    <!--  <label for="exampleInputFile">File input</label> -->
                    <input type="file" name="file">
                    <p class="help-block">Ontologies must have ".owl" extension</p>
                  </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                  <button type="submit" class="btn btn-primary">Upload</button>
                </div>
              </form>
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.row -->
      </section>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!-- Main Footer -->
    <footer class="main-footer">
      <strong> ABSTAT X.X.X </strong> source code is available on <a href="https://github.com/rAlvaPrincipe/abstatSpring">GitHub</a> under the <a href="https://www.gnu.org/licenses/">GNU Affero General Public License v3.010</a> licence.
    </footer>
    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
      <!-- Create the tabs -->
      <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
        <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
        <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
      </ul>
    </aside>
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
      immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
    <!-- ./wrapper -->
    <!-- REQUIRED JS SCRIPTS -->
    <!-- jQuery 3 -->
    <script src="jquery/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="jquery/bootstrap.min.js"></script>
    <!-- AdminLTE App -->
    <script src="jquery/adminlte.min.js"></script>
    <!-- Optionally, you can add Slimscroll and FastClick plugins.
      Both of these plugins are recommended to enhance the
      user experience. -->

    <script type="text/javascript">
       $( "#submitButton" ).click(function(event) {
        var ontologyCB = $('#ontologyCheckbox option:selected'); 
        console.log(ontologyCB)

        if (ontologyCB.length===0 ) {
          alert("Please select an ontology")
          event.preventDefault();
        }
      });

    </script>
    
  </body>
</html>

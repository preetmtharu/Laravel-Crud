@extends('admin.layouts.app')
@section('headSection')

<link rel="stylesheet" href="{{ asset('admin/plugins/select2/select2.min.css') }}">

@endsection
@section('main-content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      Text Editors
      <small>Advanced form element</small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li><a href="#">Forms</a></li>
      <li class="active">Editors</li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-md-12">
        <!-- general form elements -->
        <div class="box box-primary">
          <div class="box-header with-border">
            <h3 class="box-title">Title</h3>
          </div>
          @include('includes.messages')
          <!-- /.box-header -->
          <!-- form start -->
          <form role="form" action="{{route('post.store')}}" method="post" enctype="multipart/form-data">
            {{ csrf_field() }}
            <div class="box-body">
              <div class="col-lg-6">
               <div class="form-group">
                <label for="title">Post Title</label>
                <input type="text" class="form-control" id="title"  name="title"  placeholder="Post Title">
              </div>

              <div class="form-group">
                <label for="subtitle">Post Sub Title</label>
                <input type="text" class="form-control" id="subtitle"  name="subtitle"  placeholder="Post Sub Title">
              </div>

              <div class="form-group">
                <label for="slug">Post Slug</label>
                <input type="text" class="form-control" id="slug"  name="slug"  placeholder="Post Slug">
              </div>
            </div>

            <div class="col-lg-6">
              <div class="form-group">

                <div class="pull-right">
                 <label for="image">Post Image</label>
                 <input type="file" id="image" name="image">
               </div>

               <div class="checkbox pull-left">

                <label>
                  <input type="checkbox" name="status" value="1"> Publish
                </label>

              </div>

            </div>
            <br/><br/>


            <div class="form-group" style="margin-top:18px;">
              <label>Select Tags</label>
              <select class="form-control select2 select2-hidden-accessible" name="tags[]" multiple="" data-placeholder="Select Tag" style="width: 100%;" tabindex="-1" aria-hidden="true">

                @foreach ($tags as $tag)

                <option value="{{$tag->id}}">{{$tag->name}}</option>

                @endforeach

              </select>
            </div>

            <div class="form-group" style="margin-top:18px;">
              <label>Select Category</label>
              <select class="form-control select2 select2-hidden-accessible" name="categories[]"  multiple="" data-placeholder="Select Category" style="width: 100%;" tabindex="-1" aria-hidden="true">

                @foreach ($categories as $category)

                <option value="{{$category->id}}">{{$category->name}}</option>

                @endforeach


              </select>
            </div>

          </div>
        </div>
        <!-- /.box-body -->

        <div class="box">
          <div class="box-header">
            <h3 class="box-title">Bootstrap WYSIHTML5
              <small>Simple and fast</small>
            </h3>
            <!-- tools box -->
            <div class="pull-right box-tools">
              <button type="button" class="btn btn-default btn-sm" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                <i class="fa fa-minus"></i></button>

              </div>
              <!-- /. tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body pad">
             <textarea id="editor1" name="body" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
             
           </div>
         </div>

         <div class="box-footer">
          <button type="submit" class="btn btn-primary">Submit</button>
          <a class="btn btn-warning" href="{{ route('post.index') }}">Back </a>
        </div>
      </form>
    </div>
    <!-- /.box -->

  </div>
  <!-- /.col-->
</div>
</div>
<!-- ./row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->
@endsection

@section('footerSection')

<script src="{{ asset('admin/plugins/select2/select2.full.min.js') }}"></script>
<script>
  $(document).ready(function(){

   $(".select2").select2();
 });
  
</script>
<!-- CK Editor -->
<script src="{{ asset('admin/ckeditor/ckeditor.js') }}"></script>
<script>
  $(function () {
    // Replace the <textarea id="editor1"> with a CKEditor
    // instance, using default configuration.
    CKEDITOR.replace('editor1');
    //bootstrap WYSIHTML5 - text editor
    $(".textarea").wysihtml5();
  });
</script>

@endsection
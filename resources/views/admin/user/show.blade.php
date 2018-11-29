@extends('admin.layouts.app')

@section('headSection')

<link rel="stylesheet" href="{{ asset('admin/plugins/datatables/dataTables.bootstrap.css') }}">

@endsection
@section('main-content')
    <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">

      @include('admin.layouts.pageHead')
      
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">Blank page</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Users</h3>
          @can('posts.users_create', Auth::user())

          <a class="col-lg-offset-5 btn btn-success" href="{{ route('user.create') }}">Add New </a>

          @endcan

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fa fa-times"></i></button>
          </div>
        </div>
        <div class="box-body">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Data Table With Full Features</h3>
              @include('includes.messages')
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>S. No</th>
                  <th>User Name</th>
                  <th>Assigned Role</th>
                  <th>Status</th>
                  @can('posts.users_update', Auth::user())<th>Edit</th>@endcan
                  @can('posts.users_delete', Auth::user())<th>Delete</th>@endcan
                </tr>
                </thead>
                <tbody>
                @foreach($users as $user)
                <tr>
                  <td>{{$loop->index +1}}</td>
                  <td>{{ $user->name }}</td>
                  <td>
                    @foreach($user->roles as $role)

                    {{ $role->name }},

                    @endforeach

                    </td>
                  <td>{{ $user->status? 'Active' : 'Not Active' }}</td>
                  @can('posts.users_update', Auth::user())

                  <td><a href="{{ route('user.edit',$user->id) }}"><span class="glyphicon glyphicon-edit"></span></a></td>

                  @endcan

                 @can('posts.users_delete', Auth::user())
                 <td>
                    <form id="delete-form-{{$user->id}}" method="post" action="{{ route('user.destroy',$user->id) }}" style="display: none;">

                      {{ csrf_field() }}

                      {{ method_field('DELETE') }}

                    </form>
                    <a href="" onclick="

                    if(confirm('Are you sure, You Want to delete this?'))

                      {
                        event.preventDefault();
                        document.getElementById('delete-form-{{$user->id}}').submit();
                      }
                      else
                        {
                          event.preventDefault();
                        }
                        "><span class="glyphicon glyphicon-trash"></span></a></td>
                  @endcan
                </tr>
                @endforeach
                </tbody>
                <tfoot>
                <tr>
                  <th>S. No</th>
                  <th>User Name</th>
                  <th>Assigned Role</th>
                  <th>Status</th>
                  @can('posts.users_update', Auth::user())<th>Edit</th>@endcan
                  @can('posts.users_delete', Auth::user())<th>Delete</th>@endcan
                </tr>
                </tfoot>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          Footer
        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
@endsection

@section('footerSection')

<script src="{{ asset('admin/plugins/datatables/jquery.dataTables.min.js') }}"></script>
<script src="{{ asset('admin/plugins/datatables/dataTables.bootstrap.min.js') }}"></script>
<script>
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });
</script>

@endsection
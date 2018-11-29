 @extends('user/app')
 @section('main-content')
 @section('bg-img',asset('user/img/home-bg.jpg'))
 @section('title','Blog Home')
@section('sub-heading','Man must explore')
 <!-- Main Content -->
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">

          @foreach($posts as $post)

          <div class="post-preview">
            <a href="{{route('post',$post->slug)}}">
              <h2 class="post-title">
                {{ $post->title }}
              </h2>
              <h3 class="post-subtitle">
                {{ $post->subtitle }}
              </h3>
            </a>
            <p class="post-meta">Posted by
              <a href="#">Start Bootstrap</a>
              on September 24, 2018</p>
          </div>

          @endforeach
          <hr>
          
          <!-- Pager -->
          <ul class="pager" style="list-style-type: none;">
            <li class="next">
            {{ $posts->links() }}
           </li>
         </ul>
         
        </div>
      </div>
    </div>

    <hr>

@endsection
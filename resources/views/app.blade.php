<!DOCTYPE html>
<html lang="en">
<head>
    <title>Laravel Quickstart - Basic Todo App</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- CSS And JavaScript -->
</head>

<body>
<div class="container">
    @if (Session::has('message'))
        <div class="flash alert-info">
            <p>{{ Session::get('message') }}</p>
        </div>
    @endif

    @if($errors->any())
        <div class="flash alert-danger">
            @foreach( $errors->all() as $error )
                <p>{{ $error }}</p>
            @endforeach
        </div>
    @endif
    <b>@yield('content')</b>
</div>
</body>
</html>
<?php
if(isset(Auth::user()->id)) :
?>
<footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white" style="font-size: 12px;float: right;">Copyright &copy; {{ config('app.name', 'Laravel') }} {{date('Y')}}</p>
    </div>
    <!-- /.container -->
</footer>
<?php
endif;
?>
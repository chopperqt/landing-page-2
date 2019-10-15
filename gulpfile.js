const gulp = require("gulp");
const sass = require("gulp-sass");
const prefix = require("gulp-autoprefixer");

gulp.task("sass", function() {
   return gulp.src("src/**/*.scss")
       .pipe(prefix({
           browsers: ["> 0%"],
           cascade: false,
       }))
       .pipe(sass().on('error', sass.logError))
       .pipe(gulp.dest(function (file) {
          return file.base;
       }))
});
gulp.task('watch', function() {
    gulp.watch('./**/*.scss',gulp.series('sass'));
});
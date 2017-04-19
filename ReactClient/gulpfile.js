var babel = require('gulp-babel');
var browserify = require('browserify');
var concat = require('gulp-concat');
var connect = require('gulp-connect');
var gulp = require('gulp');
var livereload = require('gulp-livereload');
var rename = require('gulp-rename');
var sass = require('gulp-sass');
var uglify = require('gulp-uglify');
var cleanCSS = require('gulp-clean-css');
var source = require('vinyl-source-stream');
var buffer = require('vinyl-buffer');
var watchify = require('watchify');

var babelOptions = {
  plugins: ['transform-object-assign'],
  presets: ['es2015', 'react', 'stage-0']
};

gulp.task('server', function () {
  connect.server({
    host: '0.0.0.0',
    root: ['example', 'build', 'styles'],
    port: 8001,
    livereload: true
  });
});

gulp.task('sass', function () {
  gulp.src('./styles/scss/image-gallery.scss')
    .pipe(sass())
    .pipe(rename('image-gallery.css'))
    .pipe(gulp.dest('./styles/css/'))
    .pipe(livereload());
});

gulp.task('sass-no-icon', function () {
  gulp.src('./styles/scss/image-gallery-no-icon.scss')
    .pipe(sass())
    .pipe(rename('image-gallery-no-icon.css'))
    .pipe(gulp.dest('./styles/css/'))
    .pipe(livereload());
});

gulp.task('scripts', function() {
  watchify(browserify({
    entries: './example/app.js',
    extensions: ['.jsx'],
    debug: true
  }).transform('babelify', babelOptions))
    .bundle()
    .pipe(source('example.js'))
    .pipe(buffer())
    .pipe(gulp.dest('./example/'))
    .pipe(livereload());
});

gulp.task('build-src', function() {
  process.env.NODE_ENV = 'production';
  browserify({
    entries: './example/app.js',
    extensions: ['.jsx'],
    debug: true
  }).transform('babelify', babelOptions)
    .bundle()
    .pipe(source('build.js'))
    .pipe(buffer())
    .pipe(uglify())
    .pipe(gulp.dest('./build-src/'));

  gulp.src(['./styles/css/image-gallery.css', './example/app.css'])
    .pipe(concat('build.css'))
    .pipe(cleanCSS({keepSpecialComments: false}))
    .pipe(gulp.dest('./build-src/'));
});

gulp.task('demo-src', function() {
  process.env.NODE_ENV = 'production';
  browserify({
    entries: './example/app.js',
    extensions: ['.jsx'],
    debug: true
  }).transform('babelify', babelOptions)
    .bundle()
    .pipe(source('demo.js'))
    .pipe(buffer())
    .pipe(uglify())
    .pipe(gulp.dest('./demo/'));

  gulp.src(['./styles/css/image-gallery.css', './example/app.css'])
    .pipe(concat('demo.css'))
    .pipe(cleanCSS({keepSpecialComments: false}))
    .pipe(gulp.dest('./demo/'));
});

gulp.task('source-js', function () {
  return gulp.src('./src/ImageGallery.jsx')
    .pipe(concat('image-gallery.js'))
    .pipe(babel(babelOptions))
    .pipe(gulp.dest('./build'));
});

gulp.task('watch', function() {
  livereload.listen();
  gulp.watch(['styles/**/*.scss'], ['sass']);
  gulp.watch(['src/*.jsx', 'example/app.js'], ['scripts']);
});

gulp.task('dev', ['watch', 'scripts', 'sass', 'server']);
// gulp.task('build', ['source-js', 'sass', 'sass-no-icon']);
gulp.task('build', ['build-src']);
gulp.task('demo', ['demo-src']);

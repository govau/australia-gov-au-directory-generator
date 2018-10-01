var gulp = require('gulp');
var xslt = require('gulp-xslt');
var request = require('request');
var fs = require('fs');

gulp.task('download', function() {
    return 
        request('https://www.directory.gov.au/sites/default/files/export.xml')
        .pipe(fs.createWriteStream('./src/export.xml'));
});

gulp.task('html', function() {
    gulp.src('./src/export.xml')
        .pipe(xslt('./src/template.xsl', {}));
});


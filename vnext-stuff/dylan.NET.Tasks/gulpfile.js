/// <reference path="typings/node/node.d.ts"/>
var gulp = require('gulp');
var util = require('util'),
    spawn = require('child_process').spawn;
var stripAnsi = require('strip-ansi');

gulp.task('restore', function(cb) {
	var ls = spawn('sh', ['-c', 'dotnet restore']);
	ls.stdout.on('data', function (data) {
		process.stdout.write(data);
	});

	ls.stderr.on('data', function (data) {
		process.stdout.write(data);
	});

	ls.on('exit', function (code) {
		process.stdout.write('child process exited with code ' + code);
	});
});

gulp.task('build', function(cb) {
	var ls = spawn('sh', ['-c', 'dotnet build -c Debug']);
	ls.stdout.on('data', function (data) {
		process.stdout.write(stripAnsi(String(data)));
	});

	ls.stderr.on('data', function (data) {
		process.stdout.write(stripAnsi(String(data)));
	});

	ls.on('exit', function (code) {
		process.stdout.write('child process exited with code ' + code);
	});
});

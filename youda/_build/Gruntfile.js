module.exports = function(grunt) {

    // Project configuration.
    grunt.initConfig({

        //Read the package.json (optional)
        pkg: grunt.file.readJSON('package.json'),

        // Metadata.
        meta: {
            basePath: '../',
            srcPath: '../static/sass/',
            deployPath: '../static/css/'
        },

        banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - ' +
                '<%= grunt.template.today("yyyy-mm-dd") %>\n' +
                '* Copyright (c) <%= grunt.template.today("yyyy") %> ',

        // Task configuration.
        sass: {
            dist: {
                files: {
                    '<%= meta.deployPath %>index.css': '<%= meta.srcPath %>index.scss',
                    '<%= meta.deployPath %>wigets.css': '<%= meta.srcPath %>wigets.scss',
                    '<%= meta.deployPath %>common.css': '<%= meta.srcPath %>common.scss',
                    '<%= meta.deployPath %>topic.css': '<%= meta.srcPath %>topic.scss',
                    '<%= meta.deployPath %>answer_detail.css': '<%= meta.srcPath %>answer_detail.scss',
		    '<%= meta.deployPath %>system.css': '<%= meta.srcPath %>system.scss'
                },
                options: {
                }
            }
        },
        watch: {
            scripts: {
                files: [
                    '<%= meta.srcPath %>/**/*.scss'
                ],
                tasks: ['sass']
            }
        }
    });

    // These plugins provide necessary tasks.
    grunt.loadNpmTasks('grunt-contrib-sass');
    grunt.loadNpmTasks('grunt-contrib-watch');

    // Default task.
    grunt.registerTask('default', ['sass']);
};

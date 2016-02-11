var app = angular.module('app', []);

app.controller('ReaderController', function($scope){
    var file_input = document.getElementById('textfile');
    var container = document.getElementById('show-text');
    var filename = document.getElementById('filename');
    $scope.story = {};
    $scope.hr = '<hr />';
    $scope.readtext = function(file){
        var reader  = new FileReader();
        reader.onload = function(event){
            var result = event.target.result;
            try{
                $scope.story = JSON.parse(result);
                parseHistory($scope.story);
                angular.element(filename).text(file.name);
            }
            catch(err){
                $scope.story.error = true;
                throw new SyntaxError('Error parsing input file');
            }
            $scope.$apply();
        };
        reader.readAsText(file);
    };
    $scope.fileChange = function(){
        $scope.readtext(file_input.files[0]);
    };
    
    function setChunk(id){
        $scope.story.chunk = $scope.story.chunks.filter(function(chunk){
            return chunk.id === id; 
        })[0];
        //console.log($scope.story.chunk);
    }
    function parseHistory(file){
        $scope.story = file;
        setChunk('c1');
    }
    
    $scope.setChunk = setChunk;
});

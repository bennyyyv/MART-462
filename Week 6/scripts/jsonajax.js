$(document).ready(function () {
  
           $("button").click(function () {
               $("#pokemonInformation").load("data/pokedex.json", function(responseText){
                   var pokemon = JSON.parse(responseText);
                   $("#pokemonInformation").html("Id: " + pokemon.id
                   + "<br>Name: " + pokemon.name + "<br>Type: " + pokemon.type + "<br>Height: "
                   + pokemon.height + "<br>Weight: " +
                   pokemon.weight + "<br>Candy: " + pokemon.candy + "<br>Candy Count: " + pokemon.candy_count + "<br>Egg: " + pokemon.egg
                 + "<br>Spawn Chance: " + pokemon.spawn_chance + "<br>Average Spawns: " + pokemon.avg_spawns + "<br>Spawn Time: " + pokemon.spawn_time +
               "<br>Weaknesses :" + pokemon.weaknesses);
               });

           });
       });


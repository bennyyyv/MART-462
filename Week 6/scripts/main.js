let pokemon = {
  "id": 1,
  "num": "001",
  "name": "Bulbasaur",
  "type": [
    "Grass",
    "Poison"
  ],
  "height": "0.71 m",
  "weight": "6.9 kg",
  "candy": "Bulbasaur Candy",
  "candy_count": 25,
  "egg": "2 km",
  "spawn_chance": 0.69,
  "avg_spawns": 69,
  "spawn_time": "20:00",
  "weaknesses": [
    "Fire",
    "Ice",
    "Flying",
    "Psychic"
  ]
           }

       $(function () {
           $("button").click(function () {
               showPokemonInfo();
           });

       });

       function showPokemonInfo()
           {
               $("#pokemonInformation").html("Id: " + pokemon.id
               + "<br>Name:" + pokemon.name + "<br>Type:" + pokemon.type + "<br>Height:"
               + pokemon.height + "<br>Weight:<br>" +
               pokemon.weight + "<br>Candy:" + pokemon.candy + "<br>Candy Count" + pokemon.candy_count + "<br>Egg" + pokemon.egg
             + "<br>Spawn Chance" + pokemon.spawn_chance + "<br>Average Spawns" + pokemon.avg_spawns + "<br>Spawn Time" + pokemon.spawn_time +
           "<br>Weaknesses" + pokemon.weaknesses);
           }
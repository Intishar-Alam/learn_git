/*Build a quiz leaderboard with the following features:
A Player class with attributes: id, name, and score.
A Leaderboard class to:
Add players and their scores.
Display the top 3 players.
Allow players to update their scores.
Use List to store players and sort them by scores.
*/


class Player{
  int id;
  String name;
  double score;

  Player(this.id, this.name, this.score);

  @override
  String toString() {
    return 'Player{id: $id, name: $name, score: $score}';
  }
}
class Leaderboard{
  List<Player> players=[];

  AddPlayers(Player player){
    if(players.contains(player)){
      print("Player already exist");
    }
    players.add(player);
  }

  Displaying(){
    for(var player in players){
      print("$player");
    }
  }
  
  Future<void> topscorrer()async{

    players.sort((a,b)=> b.score.compareTo(a.score));
    print("Top 3 students are...");
    await Future.delayed(Duration(seconds: 3));
    for(var i=0; i < (players.length < 3 ? players.length : 3) ; i++){
      print("${i+1}. ${players[i].name} got ${players[i].score}");
    }
  }

  Updatingscore(int id, double newscore){

    for(var player in players){
      if(player.id== id){
        player.score = newscore;
        print("updated the score of ${player.name}");
        return;
      }
    }

  }
}
void main(){
  Leaderboard leaderboard= Leaderboard();

  leaderboard.AddPlayers(Player(1010, "Intishar", 20));
  leaderboard.AddPlayers(Player(2020, "sadaf", 22));
  leaderboard.AddPlayers(Player(3030, "ismi", 2));
  leaderboard.AddPlayers(Player(4040, "saji", 3));
  leaderboard.AddPlayers(Player(5050, "ismi", 44));

  leaderboard.Updatingscore(1010, 22);

  leaderboard.Displaying();
  leaderboard.topscorrer();

}
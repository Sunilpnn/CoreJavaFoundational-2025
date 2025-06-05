public class Tdd {
    public static void main(String[] args) {
        Player player1 = new Player("player1");
        player1.setName("batman");

        Player player2 = new Player("player2");
        player2.setName("Micky");

        Dice dice = new Dice();

        DiceGame game = new DiceGame(player1, player2, dice);
        game.startGame();
    }
}

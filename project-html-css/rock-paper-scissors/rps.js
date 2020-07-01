const computerPlay = () => {
    let choices = ['rock', 'paper', 'scissors'];
    return choices[Math.floor(Math.random() * Math.floor(3))];
};

const playRound = (playerSelection, computerSelection) => {
    playerSelection = playerSelection.toLowerCase();
    return(`${computerSelection} || ${playerSelection}`);
    if(playerSelection == computerSelection) {
        return('It\'s a tie');
    } else if(playerSelection == 'rock') {
        if(computerSelection == 'paper') {
            return('computer wins');
        } else if (computerSelection == 'scissors') {
            return('human wins');
        }
    } else if(playerSelection == 'paper') {
        if(computerSelection == 'rock') {
            return('human wins');
        } else if (computerSelection == 'scissors') {
            return('computer wins');
        }
    } else {
        if(computerSelection == 'rock') {
            return('computer wins');
        } else if(computerSelection == 'paper') {
            return('human wins');
        }
    }
};

/*
  get the input from the user 
*/

const getPlayerChoice = () => {
    r = window.prompt("Please input your choice of rock, paper, or scissors");
    return String(r);
};

const game = (getPlayerChoice, computerPlay, playRound) => {

    for(let i=0; i<5; ++i) {
        let winner = playRound(getPlayerChoice(), computerPlay());

    }
};

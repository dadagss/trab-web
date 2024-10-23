// Votos iniciais
let votosA = 1, votosB = 1, votosC = 1, votosD = 1, votosE = 1, votosF = 1;

// Odds iniciais
let oddsA = 1, oddsB = 1, oddsC = 1, oddsD = 1, oddsE = 1, oddsF = 1;

// Saldo inicial do usuário
let saldo = 500;

function votar(time) {
    // Verifica se o saldo é suficiente
    if (saldo >= 50) {
        saldo -= 50; // Diminui 50 reais do saldo
        document.getElementById('saldo').innerText = `Saldo: R$ ${saldo.toFixed(2)}`; // Atualiza o saldo na navbar

        // Incrementa o número de votos
        switch (time) {
            case 'A':
                votosA++;
                break;
            case 'B':
                votosB++;
                break;
            case 'C':
                votosC++;
                break;
            case 'D':
                votosD++;
                break;
            case 'E':
                votosE++;
                break;
            case 'F':
                votosF++;
                break;
        }

        // Recalcula as odds após a votação
        recalcularOdds();

        // Alerta de confirmação da aposta
        alert(`Você apostou em ${time}. Seu novo saldo é R$ ${saldo.toFixed(2)}`);
    } else {
        alert("Saldo insuficiente para fazer a aposta.");
    }
}

function recalcularOdds() {
    // Recalcular odds para Jogo 1 (Times A e B)
    const totalVotosAB = votosA + votosB;
    if (totalVotosAB > 0) {
        const proporcaoA = votosA / totalVotosAB;
        const proporcaoB = votosB / totalVotosAB;

        oddsA = (1 / proporcaoA).toFixed(2);
        oddsB = (1 / proporcaoB).toFixed(2);
    } else {
        oddsA = oddsB = 1; // Se não houver votos, as odds são 1
    }
    document.getElementById('oddsA').innerText = `Real Madrid: ${oddsA}`;
    document.getElementById('oddsB').innerText = `Barcelona: ${oddsB}`;

    // Recalcular odds para Jogo 2 (Times C e D)
    const totalVotosCD = votosC + votosD;
    if (totalVotosCD > 0) {
        const proporcaoC = votosC / totalVotosCD;
        const proporcaoD = votosD / totalVotosCD;

        oddsC = (1 / proporcaoC).toFixed(2);
        oddsD = (1 / proporcaoD).toFixed(2);
    } else {
        oddsC = oddsD = 1; // Se não houver votos, as odds são 1
    }
    document.getElementById('oddsC').innerText = `Time C: ${oddsC}`;
    document.getElementById('oddsD').innerText = `Time D: ${oddsD}`;

    // Recalcular odds para Jogo 3 (Times E e F)
    const totalVotosEF = votosE + votosF;
    if (totalVotosEF > 0) {
        const proporcaoE = votosE / totalVotosEF;
        const proporcaoF = votosF / totalVotosEF;

        oddsE = (1 / proporcaoE).toFixed(2);
        oddsF = (1 / proporcaoF).toFixed(2);
    } else {
        oddsE = oddsF = 1; // Se não houver votos, as odds são 1
    }
    document.getElementById('oddsE').innerText = `Time E: ${oddsE}`;
    document.getElementById('oddsF').innerText = `Time F: ${oddsF}`;
}

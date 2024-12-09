
module estado_porta(
    input clk,
    input reset,
    input cheio,
    input enable,
    output reg fechada
);
    // Variáveis internas
    reg Q1, Q0;           // Estados atuais
    wire EP1, EP0;        // Estados da porta

    // Lógica combinacional para calcular EP1 e EP0
    assign EP1 = (~Q1 & Q0) || (Q1 & ~Q0); // Porta alterna entre estados
    assign EP0 = ~Q0;                     // Estado baseado em Q0

    // Bloco sempre sensível ao clock e reset
    always @(posedge clk ) begin
         if (cheio) begin
            Q1 <= 0;      // Porta aberta (estado 01)
            Q0 <= 1;
        end else if (enable) begin
            Q1 <= EP1;    // Atualizar estado baseado em EP1
            Q0 <= EP0;    // Atualizar estado baseado em EP0
        end
    end

    // Lógica para determinar se a porta está fechada
    always @(*) begin
        fechada = Q1 & Q0; // Porta fechada quando em estado 11
    end

endmodule


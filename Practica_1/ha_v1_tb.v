// Testbench para modulo semisumador visto antes

`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulaci�n y el paso de simulaci�n

module ha_v1_tb;
//declaracion de se�ales

reg test_a, test_b; //las se�ales de entrada al semisumador. Se han declarado reg porque queremos inicializarlas (las variables tipo reg solo se usan para almacenar valores)
wire test_sum, test_carry; //se�ales de salida, se declaran como wire porque sus valores se fijan por el semisumador (las variables tipo wire se usan cuando no se quiere almacenar nada)

//instancia del modulo a testear, con notaci�n de posiciones de argumentos 
ha_v1 ha1(test_sum, test_carry, test_a, test_b);

//Lo siguiente comentado es una notaci�n alternativa para instanciar el m�dulo, los par�metros se denotan con un punto seguido del
//nombre del par�metro en la definici�n original del m�dulo y entre par�ntesis a qu� se conecta en el modulo actual
//no importa el orden de los par�metros definidos as� -?
//ha_v1 ha1(.a(test_a), .b(test_b), .sum(test_sum), .carry(test_carry)); 


initial
begin
  $monitor("tiempo=%0d a=%b b=%b suma=%b acarreo=%b", $time, test_a, test_b, test_sum, test_carry);
  $dumpfile("ha_v1_tb.vcd");
  $dumpvars;

  //vector de test 0
  test_a = 1'b0;
  test_b = 1'b0;
  #20;

  //vector de test 1
  test_a = 1'b0;
  test_b = 1'b1;
  #20;

  //vector de test 2
  test_a = 1'b1;
  test_b = 1'b0;
  #20;
  //vector de test 3
  test_a = 1'b1;
  test_b = 1'b1;
  #20;
  
  $finish;  //fin simulacion

end
endmodule

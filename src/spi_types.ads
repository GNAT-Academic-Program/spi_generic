package Spi_Types is

   SPI_Error       : exception;  -- bad config, programming error, unrecoverable
   SPI_Unsupported : exception;  -- driver cannot achieve requested parameters

   type Transfer_Status is (Ok, Busy, Timeout);

   type Clock_Polarity is (Low, High);
   type Clock_Phase    is (Edge_1, Edge_2);

   type Spi_Mode is record
      Polarity : Clock_Polarity;
      Phase    : Clock_Phase;
   end record;

   Mode_0 : constant Spi_Mode := (Polarity => Low,  Phase => Edge_1);
   Mode_1 : constant Spi_Mode := (Polarity => Low,  Phase => Edge_2);
   Mode_2 : constant Spi_Mode := (Polarity => High, Phase => Edge_1);
   Mode_3 : constant Spi_Mode := (Polarity => High, Phase => Edge_2);

   type Bit_Order_Kind is (MSB_First, LSB_First);

   type Data_Size_Kind is (Data_8, Data_16);

   --  Protocol-level clock speed. Driver maps to hardware prescaler.
   type Clock_Frequency is
     (F_100K, F_400K, F_1M, F_2M, F_4M, F_8M, F_10M, F_20M, F_40M);

   type Spi_Config is record
      Mode      : Spi_Mode;
      Data_Size : Data_Size_Kind;
      Bit_Order : Bit_Order_Kind;
      Frequency : Clock_Frequency;
   end record;

end Spi_Types;
package br.uefs.ecomp.model;

public class Dicionario {

	
public String operar(String s){
		
		
		switch(s){
		
			case "jal":		return "101011xx";
			case "jr":		return "101100xx";
		
			case "jal1":	return "110XXXX0XXXXXXXX";
			case "jr1":		return "110XXXX0XXXXXXXX";
			
		
			case "add":		return "00100000";
			case "addinc":  return "00100001";
			case "inca": 	return "00100011";
			case "subdec": 	return "00100100";
			case "sub": 	return "00100101";
			case "deca": 	return "00100110";
			case "lsl": 	return "00101000";
			case "asr": 	return "00101001";
			case "zeros": 	return "00110000";
			case "and": 	return "00110001";
			case "andnota": return "00110010"; 
			case "passb": 	return "00110011";
			case "andnotb": return "00110100";
			case "passa": 	return "00110101";
			case "xor": 	return "00110110"; 
			case "or": 		return "00110111";
			case "nand": 	return "00111000";
			case "xnor": 	return "00111001";
			case "passnota":return "00111010";
			case "ornota": 	return "00111011";
			case "passnotb":return "00111100";
			case "ornotb": 	return "00111101";
			case "nor":		return "00111110";
			case "ones":	return "00111111";
			
			case "loadlit": return "010xxx10";
			case "lcl": 	return "010xxx01";
			case "lch": 	return "010xxx11";
			
			case "j": 		return "101000xx";
			case "beq":		return "101001xx";
			case "bne":		return "101010xx";
			
			
			//analisar esses
				
			case "jt.zero": return "110100000000XXXXXX";
			case "jt.overflow":	return "110100000001XXXXXX";
			case "jt.neg": return "110100000010XXXXXX";
			case "jt.negzero":return "110100000011XXXXXX";
			case "jt.carry":return "110100000100XXXXXX";
								
			case "jf.zero": return "110100010101XXXXXX";
			case "jf.overflow":	return "110100010110XXXXXX";
			case "jf.neg": return "110100010111XXXXXX";
			case "jf.negzero":return "110100011000XXXXXX";
			case "jf.carry":return "110100011001XXXXXX";

			
			case "nop":	return "00000000000000000000000000000000";
		
			
			
			
			case "load":  return "10000000"; 
			case "store": return "10000001"; 
			
			case "r0": 	return "0000";
			case "r1": 	return "0001";
			case "r2": 	return "0010";
			case "r3": 	return "0011";
			case "r4": 	return "0100";
			case "r5": 	return "0101";
			case "r6": 	return "0110";
			case "r7": 	return "0111";
			case "r8": 	return "1000";
			case "r9": 	return "1001";
			case "r10": return "1010";
			case "r11":	return "1011";
			case "r12": return "1100";
			case "r13": return "1101";
			case "r14": return "1110";
			case "r15": return "1111";
			
					
			
		}
	
		return null;
	}
}

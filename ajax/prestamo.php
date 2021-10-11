<?php
session_start();

require_once "../modelos/Prestamo.php";

$prestamo=new Prestamo();

$idprestamo=isset($_POST["idprestamo"])? limpiarCadena($_POST["idprestamo"]):"";
$idlibro=isset($_POST["idlibro"])? limpiarCadena($_POST["idlibro"]):"";
$idestudiante=isset($_POST["idestudiante"])? limpiarCadena($_POST["idestudiante"]):"";
$fecha_prestamo=isset($_POST["fecha_prestamo"])? limpiarCadena($_POST["fecha_prestamo"]):"";
$cantidad=isset($_POST["cantidad"])? limpiarCadena($_POST["cantidad"]):"";
$observacion=isset($_POST["observacion"])? limpiarCadena($_POST["observacion"]):"";
switch ($_GET["op"]){
	case 'guardaryeditar':
		if (empty($idprestamo)){
			$rspta=$prestamo->insertar($idlibro,$idestudiante,$fecha_prestamo,$cantidad,$observacion);
			echo $rspta ? "Entrada registrada" : "Entrada no se pudo registrar";
		}
		else {
			$rspta=$prestamo->editar($idprestamo,$idlibro,$idestudiante,$fecha_prestamo,$cantidad,$observacion);
			echo $rspta ? "Entrada actualizada" : "Entrada no se pudo actualizar";
		}
	break;

	case 'anular':
		$rspta=$prestamo->anular($idprestamo);
 		echo $rspta ? "Entrada devuelta" : "Entrada de productos Realizada";
	break;

	case 'mostrar':
		$rspta=$prestamo->mostrar($idprestamo);
 		//Codificar el resultado utilizando json
 		echo json_encode($rspta);
	break;

	case 'listar':
		$rspta=$prestamo->listar();
 		//Vamos a declarar un array
 		$data= Array();

 		while ($reg=$rspta->fetch_object()){
 			$data[]=array(
 				"0"=>($reg->condicion=='Prestado')?'<button class="btn btn-warning" onclick="mostrar('.$reg->idprestamo.')"><i class="fa fa-eye"></i></button>'.
 					' <button class="btn btn-danger" onclick="anular('.$reg->idprestamo.')"><i class="fa fa-close"></i></button>':
 					'<button class="btn btn-warning" onclick="mostrar('.$reg->idprestamo.')"><i class="fa fa-eye"></i></button>',
 				"1"=>$reg->libro,
 				"2"=>$reg->estudiante,
 				"3"=>$reg->fecha_prestamo,
 				"4"=>$reg->cantidad,
 				"5"=>$reg->observacion,
 				"6"=>($reg->condicion=='Prestado')?'<span class="label bg-green">Prestado</span>':
 				'<span class="label bg-red">Devuelto</span>'
 				);
 		}
 		$results = array(
 			"sEcho"=>1, //Información para el datatables
 			"iTotalRecords"=>count($data), //enviamos el total registros al datatable
 			"iTotalDisplayRecords"=>count($data), //enviamos el total registros a visualizar
 			"aaData"=>$data);
 		echo json_encode($results);

	break;

	case "SelectLibro":
        require_once "../modelos/Libro.php";
        $libro = new Libro();
        $rspta = $libro->select();
        while ($reg = $rspta->fetch_object())
        {
                echo '<option value=' . $reg->idlibro . '>' . $reg->titulo . '</option>';
            }   
    break;

    case "SelectEstudiante":
        require_once "../modelos/Estudiante.php";
        $estudiante = new Estudiante();
        $rspta = $estudiante->select();
        while ($reg = $rspta->fetch_object())
        {
                echo '<option value=' . $reg->idestudiante . '>' . $reg->nombre . '</option>';
            }   
    break;


}
//Fin de las validaciones de acceso
//}
//else
//{
 // require 'noacceso.php';
//}
//}
//ob_end_flush();
?>
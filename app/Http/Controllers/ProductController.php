<?php 

namespace App\Http\Controllers;

use App\Http\Requests\ProductRequest;
use App\Models\Image;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Traits\ImageTrait;

class ProductController extends BaseController 
{

  use ImageTrait;
  /**
   * Display a listing of the resource.
   *
   * @return Response
   */
  public function index()
  {
    
  }

  /**
   * Show the form for creating a new resource.
   *
   * @return Response
   */
  public function create()
  {
    
  }

  /**
   * Store a newly created resource in storage.
   * @param ProductRequest $request
   * @return Response
   */
  public function store(ProductRequest $request)
  {
    try {
      $product = Product::create($this->buildStorableProduct($request->all()));

      $images = $this->processImagesUpload($request, $product->id);
      
      $responseData = array(
        'product' => $product,
        'images' => $images
      );
      return $this->sendResponse($responseData, null, 201);
    } catch (\Throwable $th) {
      return $this->sendError($th->getMessage(), null, 402);
    }
  }

  /**
   * Display the specified resource.
   *
   * @param  int  $id
   * @return Response
   */
  public function show($id)
  {
    
  }

  /**
   * Show the form for editing the specified resource.
   *
   * @param  int  $id
   * @return Response
   */
  public function edit($id)
  {
     var_dump("nothing");
  }

  /**
   * Update the specified resource in storage.
   *
   * @param  int  $id, ProductRequest $productRequest
   * @return Response $response
   */
  public function update($id, Request $request)
  {
    try{
      $product = Product::where('id', $id)->update($this->buildStorableProduct($request->all(), 'update'));
     
      //$images = $this->processImagesUpload($request, $id);
      
      $responseData = array(
        'product' => $product,
        //'images' => $images
      );
      return $this->sendResponse($responseData, null, 201);
    }catch(\Throwable $th){
        return $this->sendError([], $th->getMessage(), 401);
    }
  }

  /**
   * Remove the specified resource from storage.
   *
   * @param  int  $id
   * @return Response
   */
  public function destroy($id)
  {
    
  }

  public function listProductsWithoutFilter(){
    try{
      $products = Product::with(['category', 'user', 'images'])->orderByDesc('updated_at')->get();
      return $this->sendResponse($products, null);
    }catch(\Throwable $th){
        return $this->sendResponse([], $th->getMessage());
    }
  }

  public function listProductsWithFilter(){
    
  }

  public function buildStorableProduct($request, $type = 'add'){
    $product = array(
      'name' => $request['name'],
      'description' => $request['description'],
      'piece_number' => $request['pieceNumber'],
      'category_id' => $request['categoryId'],
      'location' => $request['location'],
      'bathroom' => $request['bathroom'],
      'price' => $request['price'],
    );
   
    if($type == 'add'){
      $product['user_id'] = Auth::user()->id;
      $product['status'] = "pending";
    }else{
      $product['status'] = $request['status'];
    }
    
    if(array_key_exists('isAirConditioned', $request)){
      $product['is_air_conditioned'] = true;
    }
    if(array_key_exists('isVentilated', $request)){
      $product['is_ventilated'] = true;
    }
    if(!array_key_exists('priceType', $request)){
      $product['price_type'] = "m";
    }else{
      $product['price_type'] = $request['priceType'];
    }

    return $product;
  }

  /**
  * Function to process images upload to directory and save on database
  * @param Request $request, int $productId
  * @return Array $images
  */
  public function processImagesUpload(Request $request, $productId){
    $images = $this->verifyAndUpload($request);
      foreach ($images as $key => $image) {
        if($key == 0){
          $type = 'primary';
        }else{
          $type = 'other';
        }
        $dataImage = array(
          'product_id' => $productId,
          'name' => $image,
          'type' => $type
        );
        $imageEntity =  new Image($dataImage);
        $imageEntity->save();
      }
     return $images;
  }

}

?>
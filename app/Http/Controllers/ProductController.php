<?php 

namespace App\Http\Controllers;

use App\Http\Requests\ProductRequest;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProductController extends BaseController 
{

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
      $product = new Product();
      $product->name = $request->name;
      $product->description = $request->description;
      $product->piece_number = $request->pieceNumber;
      $product->user_id = Auth::user()->id;
      $product->status = "pending";
      $product->category_id = $request->categoryId;
      $product->location = $request->location;
      $product->bathroom = $request->bathroom;
      $product->price = $request->price;
      if($request->isAirConditioned || $request->isAirConditioned == 1){
        $product->is_air_conditioned = true;
      }
      if($request->is_ventilated || $request->is_ventilated == 1){
        $product->is_ventilated = true;
      }
      if($request->price_type || $request->price_type == 1){
        $product->price_type = "m";
      }

      $product->save();

      $this->sendResponse($product, null, 201);
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
    
  }

  /**
   * Update the specified resource in storage.
   *
   * @param  int  $id
   * @return Response
   */
  public function update($id)
  {
    
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
      $products = Product::with(['category', 'user', 'images'])->get();
      return $this->sendResponse($products, null);
    }catch(\Throwable $th){
        return $this->sendResponse([], $th->getMessage());
    }
  }

  public function listProductsWithFilter(){
    
  }

}

?>
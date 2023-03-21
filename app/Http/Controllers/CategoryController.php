<?php 

namespace App\Http\Controllers;

use App\Http\Requests\CategoryRequest;
use App\Models\Category;

class CategoryController extends BaseController 
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
   *
   * @return Response
   */
  public function store(CategoryRequest $request)
  {
      try {
        $category = new Category();
        $category->name = $request->name;
        $category->status = $request->status;
        $category->save();
        return $this->sendResponse($category, 'Catégorie ajoutée avec succès.');
      } catch (\Throwable $th) {
        return $this->sendError("Impossible d'ajouter la catégorie", 401);
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
   * @param  int  $id, CategoryRequest $request
   * @return Response
   */
  public function update($id, CategoryRequest $categoryRequest)
  {
    try {
      $category = Category::where('id', $id)->update($categoryRequest->all());
      return $this->sendResponse($category, 'Catégorie ajoutée avec succès.');
    } catch (\Throwable $th) {
      return $this->sendError("Impossible de mettre a jour la catégorie", 401);
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
    try {
      $category = Category::find($id);
      $category->delete();
      return $this->sendResponse(null, 'Catégorie ajoutée avec succès.');
    } catch (\Throwable $th) {
      return $this->sendError("Impossible de mettre a jour la catégorie", 401);
    }
  }

  /**
   * List all categories 
   * No token required
   */
  public function categoryList(){
    try {
      $categories = Category::all();
      return $this->sendResponse($categories, '');
    } catch (\Throwable $th) {
      return $this->sendError("Impossible d'obtenir la liste des catégories", 401);
    }
  }
  
}

?>
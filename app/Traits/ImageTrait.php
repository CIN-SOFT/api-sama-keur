<?php

namespace App\Traits;

use Illuminate\Http\Request;

trait ImageTrait {

    /**
     * @param Request $request
     * @return $this|false|string
     */
    public function verifyAndUpload(Request $request, $fieldname = 'files', $directory = 'images' ) {
        $images = [];
        if( $request->hasFile( $fieldname ) ) {
            foreach ($request->file($fieldname) as $key => $file) {
                $filename  = $file->getClientOriginalName();
                $extension = $file->getClientOriginalExtension();
                $picture   = date('His').'-'.$filename;
                //move image to public/img folder
                $file->move(public_path($directory), $picture);
                //
                $images[$key] = $picture;
               // }
            }

        }

        return $images;

    }

}
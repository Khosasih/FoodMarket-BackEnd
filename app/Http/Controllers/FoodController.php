<?php

namespace App\Http\Controllers;

use App\Http\Requests\FoodRequest;
use App\Models\Food;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;


class FoodController extends Controller
{
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $pagination = 2;
        $food = Food::paginate($pagination);

        return view('food.index',[
            'food' => $food
        ])->with('i',($request->input('page',1) - 1) * $pagination);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('food.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(FoodRequest $request)
    {
        $data = $request->all();

        $data['picturePath'] = $request->file('picturePath')->store('assets/food', 'public');

        Food::create($data);

        return redirect()->route('food.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Food $food)
    {
        //

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Food $food)
    {
        return view('food.edit',[
            'item' => $food
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(FoodRequest $request, Food $food)
    {
        $data = $request->all();
        if($request->file('picturePath'))
        {
            $data['picturePath'] = $request->file('picturePath')->store('assets/food', 'public');
        }
        $food->update($data);
        return redirect()->route('food.index');

        //updatetan food image
        
        // $data = $request->all();
        // $data['slug'] = Str::slug($request->name);

        // if($request->hasFile('picturePath'))
        // { $request->validate([
        //     'picturePath' => 'required|image|mimes:png,jpg,jpeg,gif,svg|max:100'
        // ]);
        // $data['picturePath'] = $request->file('picturePath')->store('assets/food', 'public');
        // if (Storage::exists('assets/food' . $food->picturePath)) {
        //     Storage::disk('local')->delete('assets/food' . $food->picturePath);
        // }
        // $food->update($data);
        // return redirect()->route('food.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Food $food)
    {
        $food->delete();
        return redirect()->route('food.index');
    }
}

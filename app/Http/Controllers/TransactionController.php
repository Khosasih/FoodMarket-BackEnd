<?php

namespace App\Http\Controllers;

use App\Models\Transaction;
use Illuminate\Container\RewindableGenerator;
use Illuminate\Http\Request;

class TransactionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $pagination = 2;
        $transaction = Transaction::with(['food','user'])->paginate($pagination);
        return view(
            'transactions.index',[
                'transactions' => $transaction
            ])->with('i',($request->input('page',1)- 1)* $pagination);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Transaction $transaction)
    {
        return view('transactions.detail',[
            'item' => $transaction
        ]);

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function changeStatus(Request $request, $id, $status)
    {
        $transaction = Transaction::findOrFail($id);

        $transaction->status = $status;
        $transaction->save();

        return redirect()->route('transactions.show', $id);
    }
}

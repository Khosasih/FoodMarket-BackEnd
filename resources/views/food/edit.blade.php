<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Food &raquo; {{ $item->name }} &raquo; Edit
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div>
                @if ($errors->any())
                    <div class="mb-5" role="alert">
                        <div class="bg-red-500 text-white font-bold rounded-t px-4 py-2">
                            There's something wrong
                        </div>
                        <div class="border border-t-0 border-red-400 rounded-b bg-red-100 px-4 py-3 text-red-700">
                            <p>
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </p>
                        </div>
                    </div>
                @endif
                <form action="{{ route('food.update', $item->id) }}" class="w-full" method="POST"
                    enctype="multipart/form-data">
                    @csrf
                    @method('put')
                    <div class="flex flex-wrap -mx-3 mb-6">
                        <div class="w-full px-3">
                            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2"
                                for="grid-last-name">
                                Food
                            </label>
                            <input value="{{ old('name') ?? $item->name }}" name="name"
                                class="appearance-none block w-full bg-gray-200 text-gray-700 border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                                id="grid-last-name" type="text" placeholder="food name">
                        </div>
                    </div>
                    <div class="flex flex-wrap -mx-3 mb-6">
                        <div class="w-full px-3">
                            <label class="block unppercase tracking-wide text-gray-700 text-xs font-bold mb-2"
                                for="grid-last-name">
                                Descriptions
                            </label>
                            <input value="{{ old('description') ?? $item->description }}" name="description"
                                class="appearance-none block w-full bg-gray-200 text-gray-700 border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                                id="grid-last-name" type="text" placeholder="descriptions">
                        </div>
                    </div>
                    <div class="flex flex-wrap -mx-3 mb-6">
                        <div class="w-full px-3">
                            <label class="block unppercase tracking-wide text-gray-700 text-xs font-bold mb-2"
                                for="grid-last-name">
                                Image
                            </label>
                            <div class="flex flex-wrap -mx-3 mb-6">
                                <div class="w-full px-3">
                                    <img src="{{ asset('storage/' . $item->picturePath) }}" alt="image"
                                        height="70px" width="70px" />
                                </div>
                            </div>
                            <input name="picturePath"
                                class="appearance-none block w-full bg-gray-200 text-gray-700 border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                                id="grid-last-name" type="file" placeholder="Image">
                        </div>
                    </div>
                    <div class="flex flex-wrap -mx-3 mb-6">
                        <div class="w-full px-3">
                            <label class="block unppercase tracking-wide text-gray-700 text-xs font-bold mb-2"
                                for="grid-last-name">
                                Ingredients
                            </label>
                            <input value="{{ old('ingredients') ?? $item->ingredients }}" name="ingredients"
                                class="appearance-none block w-full bg-gray-200 text-gray-700 border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                                id="grid-last-name" type="text" placeholder="ingredients">
                            <p class="text-gray-600 text-xs italic">contoh: Paprika, Bawang merah, Terigu</p>
                        </div>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-2 ">
                        <div class="flex flex-wrap">

                            <div class="flex flex-wrap -mx-2 mb-6">
                                {{-- <div class="w-full px-3"> --}}
                                <label class="block unppercase tracking-wide text-gray-700 text-xs font-bold mb-2"
                                    for="grid-last-name">
                                    Price
                                </label>
                                <input value="{{ old('price') ?? $item->price }}" name="price"
                                    class="appearance-none block w-full bg-gray-200 text-gray-700 border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                                    id="grid-last-name" type="number" placeholder="price">
                                <p class="text-gray-600 text-xs italic">tidak menggunakan koma (,)</p>
                                {{-- </div> --}}
                            </div>
                        </div>
                        <div class="flex flex-wrap -mx-2 mb-6">
                            {{-- <div class="w-full px-3"> --}}
                            <label class="block unppercase tracking-wide text-gray-700 text-xs font-bold mb-2"
                                for="grid-last-name">
                                Rate
                            </label>
                            <input value="{{ old('rate') ?? $item->rate }}" name="rate"
                                class="appearance-none block w-full bg-gray-200 text-gray-700 border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                                id="grid-last-name" type="number" step="0.01" max="5" placeholder="rate">
                            <p class="text-gray-600 text-xs italic">contoh: 1.0</p>
                            {{-- </div> --}}
                        </div>
                    </div>
            </div>
            <div class="flex flex-wrap -mx-3 mb-6">
                <div class="w-full px-3">
                    <label class="block unppercase tracking-wide text-gray-700 text-xs font-bold mb-2"
                        for="grid-last-name">
                        Types
                    </label>
                    <select name="types_id" class="appearance-none block w-full bg-gray-200 text-gray-700 border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" data-style="select-with-transition">
                        @foreach ($types as $data)
                            <option value="{{ $data->id }}"{{ $item->types_id == $data->id ? 'selected' : null }}>{{ $data->name }}
                            </option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="flex flex-wrap -mx-3 mb-6">
                <div class="w-full px-3 text-right">
                    <button type="submit"
                        class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">
                        Save
                    </button>
                </div>
            </div>
            </form>
        </div>
    </div>
    </div>
</x-app-layout>

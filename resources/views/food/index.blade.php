<x-app-layout>
    <x-slot name="header">
        <link href="https://fonts.googleapis.com/css2?family=Material+Icons"
      rel="stylesheet">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Food') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="mb-10">
                <a href="{{ route('food.create') }}" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded flex items-center">
                <i class="material-icons">add</i> Create Food
                </a>
            </div>
            <div class="bg-white">
                <table class="table auto w-full">
                    <thead>
                        <tr>
                            <th class="border px-6 py-4">ID</th>
                            <th class="border px-6 py-4">Name</th>
                            <th class="boder px-6 py-4">Price</th>
                            <th class="border px-6 py-4">Image</th>
                            <th class="border px-6 py-4">Rate</th>
                            <th class="border px-6 py-4">Types</th>
                            <th class="border px-6 py-4">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($food as $item)
                        <tr>
                            <td class="border px-6 py-4">{{ ++$i }}</td>
                            <td class="border px-6 py-4">{{ $item->name }}</td>
                            <td class="border px-6 py-4">{{ number_format($item->price) }}</td>
                            <td class="border px-6 py-4">
                                <img src= "{{ asset('storage/' . $item->picturePath) }}" alt="Image" width="70px" height="70px"/>
                            </td>
                            <td class="border px-6 py-4">{{ $item->rate }}</td>
                            <td class="border px-6 py-4">{{ $item->types->name }}</td>
                            <td class="border px-6 py-4 text-center">
                                <a href="{{ route('food.edit', $item->id) }}" class="inline-block bg-orange-500 hover:bg-orange-700 px-6 py-2 text-white font-bold rounded">
                                    Edit
                                </a>
                                <form action="{{ route('food.destroy', $item->id) }}" method="POST" class="inline-block" onclick="return confirm('Are you sure?')">
                                    {!! method_field('delete') . csrf_field() !!}
                                <button type="submit" class="bg-red-500 hover:bg-red-700 px-6 py-2 text-white font-bold rounded">
                                    Delete
                                </button>
                                </form>
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="6" class="border text-center p-5">
                                Data tidak ditemukan
                            </td>
                        </tr>
                        @endforelse
                        </tbody>
                    </table>
                </div>
                <div class="text-center mt-5">
                    {{ $food->links() }}
                </div>
            </div>
        </div>
    </div>
</x-app-layout>